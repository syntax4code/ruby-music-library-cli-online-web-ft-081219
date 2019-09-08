require 'pry'
class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = [] #@@all is initialized as an empty array
  def initialize(name) #initialize accepts a name for the new genre
    @name = name #retrieves the name of a genre
    @songs = [] #
  end

  def self.all
    @@all # returns the class variable @@all

  end

  def self.destroy_all #.destroy_all resets the @@all class variable to an empty array
    all.clear
  end

  def save
    self.class.all << self #Instances should respond to a #save method that adds the instance itself into the appropriate @@all class variable
  end

  def self.create(name) #.create initializes and saves the genre
    genre = new(name)
    genre.save
    genre

    # Or, as a one-liner:
    # new(name).tap{ |g| g.save }
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
