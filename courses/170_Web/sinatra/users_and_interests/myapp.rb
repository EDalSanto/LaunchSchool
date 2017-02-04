require 'sinatra'
require 'sinatra/reloader' if development?
require 'yaml'

before do
  @users = YAML.load_file("users.yaml")
  @users_names = @users.keys.map { |name| name.to_s }
end

helpers do
  def count_interests(users)
    users.reduce(0) do |sum, (name, user)|
      sum + user[:interests].size
    end
  end
end

get '/' do

  erb :list
end

get '/users/:name' do
  @name = params[:name].to_sym
  current_user = @users[@name]

  @email = current_user[:email]
  @interests = current_user[:interests]

  @users_names.select! { |user| user != params[:name] }

  erb :user
end
