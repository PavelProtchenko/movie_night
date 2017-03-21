current_path = "./" + File.dirname(__FILE__)

require_relative "movie"

# We create the arrays: one for files, one for directors and one for movies
movies_path = Dir["data/*.txt"]
movies = []
directors = []

puts "Program \"Movie Night\""
puts

# We create loop and inside of it class instance with argument (path to txt file)
# For directors and movies are two separate arrays
for item in movies_path
  movie = MovieChoice.new(item)
  movies << movie
  directors << movie.director
end

# Every director is uniq
directors.uniq!

# List of all directors and index starts with 0 so + 1
directors.each_with_index do |director, index|
  puts "#{index + 1}: " + director
end

puts
puts "Movie of directors would you like to watch tonight?"

user_choice = STDIN.gets.to_i - 1

# This loop works while you won't enter the correct id of director and \
# check up your input for other incorrect symbols
while directors[user_choice] == nil ||
    user_choice < 0
  puts "There is no such director. Enter the correct id of director."
  user_choice = STDIN.gets.to_i - 1
end

# If in array with movies the object is found = director so add it to the \
# array of all_movies
all_movies = movies.select { |movie| movie.director == directors[user_choice] }

puts "Tonight you chose:\n"
puts
puts "#{all_movies.sample.movie_info}"
