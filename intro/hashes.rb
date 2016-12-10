movies = ["The Matrix", "Inception", "Men in Black"]
year = [1999, 2010, 1994];
movie_hash = {}
movies.each do |movie|
  movie_hash[movie] = year[movies.index(movie)]
end

if __FILE__ == $PROGRAM_NAME
  puts movie_hash
end

