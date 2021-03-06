# test/cms_test.rb
ENV["RACK_ENV"] = "test"

require "fileutils"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_viewing_text_document
    create_document "history.txt", "Ruby 0.95 released"

    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end

  def test_viewing_markdown_document
    create_document "about.md", "# Ruby is..."

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_document_not_found
    get "/notafile.ext"

    assert_equal 302, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_editing_not_signedin
    get "/changes.txt/edit"

    assert_equal "You must be signed in to do that.", session[:message]
    assert_equal 302, last_response.status
  end

  def test_editing_document
    create_document "changes.txt"
    
    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_updating_document_not_signed_in
    post "/changes.txt", content: "new content"

    assert_equal "You must be signed in to do that.", session[:message]
    assert_equal 302, last_response.status
  end

  def test_updating_document
    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "File changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_new
    get "/new"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input" 
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_file_not_signed_in
    post "/create_file", new_filename: "newfile.txt"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_file
    post "/create_file", {new_filename: "new_document.txt"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "new_document.txt was successfully created!", session[:message]

    get "/"
    assert_includes last_response.body, "new_document.txt" 
  end

  def test_create_file_without_proper_name
    post "/create_file", {new_filename: "new_document"}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Improper file extension."
  end

  def test_delete_not_signed_in
    post "/changes.txt/destroy"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_delete
    create_document "changes.txt"

    post "/changes.txt/destroy", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "changes.txt was deleted.", session[:message]
  end

  def test_valid_signin
    get "/users/signin"
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")

    post "/users/signin", username: "admin", password: "secret" 
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]
  end

  def test_invalid_signin
    username = "user"
    post "/users/signin", username: username, password: "secret" 
    assert_equal 422, last_response.status

    assert_nil session[:username]
    assert_includes last_response.body, "Invalid Credentials"
  end

  def test_signout
    post "/users/signin", username: "admin", password: "secret"
    assert_equal "Welcome!", session[:message]

    post "/users/signout"
    get last_response["Location"]

    assert_nil session[:username]
    assert_includes last_response.body, "You have been signed out"
    assert_includes last_response.body, "Sign In"
  end

  def test_duplicate_button
    get "/", admin_session

    create_document "document.txt"

    post "/duplicate", {}
    assert_equal 302, last_response.status
    assert_equal "new_document.txt was successfully created!", session[:message]

    get "/"
    assert_includes last_response.body, "new_document.txt" 
  end
end
