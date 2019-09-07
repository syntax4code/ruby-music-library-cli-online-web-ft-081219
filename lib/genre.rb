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
    binding.pry
  end

  def self.destroy_all #the class should be able to empty its @@all array via a class method .destroy_all
    all.clear
  end

  def save
    self.class.all << self #Instances should respond to a #save method that adds the instance itself into the appropriate @@all class variable
  end

  def self.create(name) #all classes should implement a custom constructor .create that instantiates an instance using .new but also invokes #save on that instance, forcing it to persist immediately.
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
