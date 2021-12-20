require 'json'

class MoviesParser
  def initialize(movie_filename, genres_filename)
    file = File.read(movie_filename)
    @movie_data = JSON.parse(file, :symbolize_names => true)
    file = File.read(genres_filename)
    @genres_data = JSON.parse(file, :symbolize_names => true)
  end
  def read
    @movie_data[:results].map { |hsh|  hsh[:genre_ids].empty? ? hsh[:genre]='General' : hsh[:genre]=@genres_data[:genres].find { |x| hsh[:genre_ids][0]==x[:id] }[:name] }
    # @movie_data[:results].map do |hsh|
    #   if hsh[:genre_ids].empty?
    #     hsh[:genre]='General'
    #   else
    #     hsh[:genre]=@genres_data[:genres].find { |x| hsh[:genre_ids][0]==x[:id] }[:name]
    #   end
    # end
    pp @movie_data
    # pp @genres_data
  end
end
# a ? b : c
#   if a then b else c end
#
movie_parser = MoviesParser.new('movies.json','genres.json')
movie_parser.read


