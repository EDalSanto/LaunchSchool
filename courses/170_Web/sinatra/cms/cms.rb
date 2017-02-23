require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'fileutils'
require 'bcrypt'
require 'yaml'

configure do
  enable :sessions
 # set :session_secret, 'super secret'
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => 'super secret'
end

def valid_credentials?(username, password)
  credentials = load_users_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username]) 
    # Bcrypt #== overrides standard #== do hash password and do comparison
    bcrypt_password == password
  else
    false
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("test/data", __dir__)
  else
    File.expand_path("data", __dir__)
  end
end

def credentials_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("test/users.yml", __dir__)
  else
    File.expand_path("users.yml", __dir__)
  end
end

def load_users_credentials
  YAML.load_file(credentials_path)
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

def signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

get "/" do
  pattern = File.join(data_path, "/*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index
end

get "/new" do
  erb :new
end

get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

get "/:filename/edit" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)

  erb :edit
end

post "/create_file" do
  require_signed_in_user

  new_filename = params[:new_filename].to_s
  extname = File.extname(new_filename)

  if new_filename.size.zero?
    session[:message] = "No name provided for file. Please provide a filename."
    status 422
    erb :new
  elsif extname != ".txt" && extname != ".md"
    session[:message] = "Improper file extension. Please provide a .txt or .md"
    status 422
    erb :new
  else
    file_path = File.join(data_path, new_filename)
    File.write(file_path, "")
    session[:message] = "#{new_filename} was successfully created!"

    redirect "/"
  end
end

post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "File #{params[:filename]} has been updated."
  redirect "/"
end

post "/:filename/destroy" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  
  File.delete(file_path)

  session[:message] = "#{params[:filename]} was deleted."
  redirect "/"
end

get "/users/signin" do
  erb :signin
end

post "/users/signin" do
  username = params[:username]
  password = params[:password]

  if valid_credentials?(username, password) 
    session[:username] = params[:username] 
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid Credentials"
    status 422
    erb :signin
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/users/signup" do
  erb :signup
end

post "/users/create" do
  credentials = load_users_credentials

  new_username = params[:new_username]
  new_password = params[:new_password]

  unless credentials.key?(new_username)
    credentials[new_username] = BCrypt::Password.create(new_password).to_s
    File.open(credentials_path, 'w') { |f| f.write credentials.to_yaml }
    session[:message] = "New user #{new_username} created successfully!"
    redirect "/"
  else
    session[:message] = "Username already exists!"
    redirect "/users/signup"
  end
end
