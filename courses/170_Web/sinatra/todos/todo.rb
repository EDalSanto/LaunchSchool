require "sinatra"
require "sinatra/content_for"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
  #disable :protection
  #use Rack::Session::Cookie, :key => 'rack.session',
  #                           :path => '/',
  #                           :secret => 'secret'
end

before do
  session[:lists] ||= []
end

helpers do
  def valid_name_size?(text)
    text.size.between?(1,100)
  end

  def name_already_exists?(list_name)
    session[:lists].any? { |list| list[:name] == list_name }
  end

  def error_for_list_name(list_name)
    if !valid_name_size?(list_name)
      "List name must be between 1 and 100 characaters."
    elsif name_already_exists?(list_name)
      "List name must be unique"
    end
  end

  def error_for_todo(text)
    if !valid_name_size?(text)
      "Todo must be between 1 and 100 characaters."
    end
  end

  def list_done?(list)
    list[:todos].all? { |todo| todo[:completed] == true } &&
      list[:todos].size >= 1
  end

  def todos_done(list)
    list[:todos].count { |todo| todo[:completed] }
  end

  def total_todos(list)
    list[:todos].size
  end

  def list_class(list)
    "complete" if list_done?(list)
  end

  def load_list(list_id)
    list = session[:lists][list_id]
    return list if list

    session[:error] = "The specified list was not found."
    redirect "/lists"
    halt
  end
end

get "/" do
  redirect "/lists"
end

# View all lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Renders new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Creates new list
post "/lists" do
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# View a specific list
get "/lists/:list_id" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id) 
  erb :list, layout: :layout
end

# Edit a specific list
get "/lists/:list_id/edit" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  erb :edit_list, layout: :layout
end

# Update an existing Todo list
post "/lists/:list_id" do
  list_name = params[:list_name].strip
  @list_id = params[:list_id].to_i
  @list = load_list(list_id)


  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{params[:list_id]}"
  end
end

# Delete a Todo list
post "/lists/:list_id/destroy" do
  list_id = params[:list_id].to_i
  @list = load_list(list_id)

  list_name = @list[:name]
  session[:lists].delete(@list)

  session[:success] = "The list \"#{list_name}\" has been deleted."

  redirect "/lists"
end

# Add a new Todo to a list
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: params[:todo], completed: false }
    session[:success] = "Todo was added!"
    redirect "/lists/#{@list_id}"
  end
end

# Delete a Todo element
post "/lists/:list_id/todos/:todo_id/destroy" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  todo = @list[:todos][todo_id]

  @list[:todos].delete(todo)

  session[:success] = "The todo #{todo[:name]} was deleted!"
  redirect "/lists/#{@list_id}"
end

# Mark a Todo as done
post "/lists/:list_id/todos/:todo_id/patch" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  todo = @list[:todos][todo_id]

  is_completed = params[:completed] == "true"
  todo[:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"

end

# Mark all todos as done
post "/lists/:list_id/todos/patch" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  @list[:todos].each { |todo| todo[:completed] = true }

  session[:success] = "All todos have been marked true."
  redirect "/lists/#{@list_id}"

end
