require "sinatra"
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
  list_name = params[:list_name]

  if list_name.size >= 1 && list_name.size <= 100
    session[:lists] << { name: params[:list_name], todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  else
    erb :new_list, layout: :layout
  end
end
