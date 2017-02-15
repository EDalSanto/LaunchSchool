require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get "/" do 
  root = File.expand_path("..", __FILE__)

  @files = Dir.glob(root + "/data/*").map do |file|
    File.basename(file)
  end

  erb :index 
end

get "/:file" do
  file = params[:file]
  path = File.expand_path(file, "data")
  
  headers["Content-Type"] = "text/plain"
  File.read(path)
end
