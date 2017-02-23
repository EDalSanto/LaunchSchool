require 'sinatra'
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => 'super_secret'
  set :erb, :escape_html => true
end

before do
  session[:numbers] ||= []
end

helpers do
  def numbers_sum 
    session[:numbers].reduce(0) { |sum, num| sum += num.to_i } 
  end
end

get "/" do 
  erb :index
end

get "/random_letter" do
  ('a'..'z').to_a.sample 
end

get "/new_number" do
  erb :new_number
end

post "/add_number" do
  session[:numbers] << params[:new_number].to_i
  session[:message] = "#{params[:new_number]} added to numbers!"

  redirect "/"
end
