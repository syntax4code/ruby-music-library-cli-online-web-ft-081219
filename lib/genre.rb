class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = [] #each class should contain a class variable @@all that is set to an empty array and is prepared to store all saved instances of the class. This class variable should be accessible via the class method .all.

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self #Instances should respond to a #save method that adds the instance itself into the appropriate @@all class variable
  end

  def self.create(name)
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
