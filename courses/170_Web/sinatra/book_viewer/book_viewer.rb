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

    # Add id to each paragraph index which makes each one accessible and redirects to it after anchor tag
    paragraphs.each_with_index.map do |line, index| 
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight_query(text, query)
    text.gsub!(query, "<strong>#{query}</strong>")
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

def find_matching_paragraphs(chapter_contents, query)
  matches = {}
  paragraphs = chapter_contents.split("\n\n")
  paragraphs.each_with_index do |paragraph, index|
    matches[index] = highlight_query(paragraph, query) if paragraph.include?(query) 
  end
  matches
end

def chapters_matching(query)
  results = []

  return results unless query

  # method takes a block which estracts key information from each chapter
  # local block variables are binded to block which is passed as argument to
  # each_chapter
  each_chapter do |number, name, contents|
    matches = find_matching_paragraphs(contents, query)
    results << { number: number, name: name, paragraphs: matches }  
  end
  
  results 
end

get '/search' do
  @chapters = chapters_matching(params[:query])  

  erb :search
end
