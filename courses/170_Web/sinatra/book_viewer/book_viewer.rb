require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines('data/toc.txt')
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

helpers do
  def in_paragraphs(chapter_contents)
    paragraphs = chapter_contents.split("\n\n")
    paragraphs.map { |line| "<p>#{line}</p>" }.join
  end
end

not_found do
  redirect "/"
end

get '/chapters/:number' do 
  chapter_number = params[:number].to_i

  chapter_name = @contents[chapter_number - 1]
  @title = "Chapter #{chapter_number}: #{chapter_name}"
  @chapter_contents = File.read("data/chp#{chapter_number}.txt")

  erb :chapter
end

def each_chapter(&block)
  @contents.each_with_index do |chapter_name, index|  
    name = chapter_name
    number = index + 1
    contents = File.read("data/chp#{number}.txt") 
    yield(number, name, contents)
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  # method takes a block which estracts key information from each chapter
  # local block variables are binded to block which is passed as argument to
  # each_chapter
  each_chapter do |number, name, contents|
    results << { number: number, name: name } if contents.include? query  
  end

  # returns array of hashes, each hash containing matching chapter's number and
  # name
  results
end

get '/search' do
  @results = chapters_matching(params[:query])  

  erb :search
end
