class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []  #@@all is initialized as an empty array

  def initialize(name) ##initialize  accepts a name for the new artist
    @name = name #retrieves the name of an artist
    @songs = []
  end

  def self.all # This class variable should be accessible via the class method .all
    @@all
  end

  def self.destroy_all #class should be able to empty its @@all array via a class method .destroy_all
    all.clear
  end

  def save
    self.class.all << self #Instances should respond to a #save method that adds the instance itself into the appropriate @@all
  end

  def self.create(name) #classes should implement a custom constructor .create that instantiates an instance using .new but also invokes #save on that instance, forcing it to persist immediately.
    artist = new(name)
    artist.save
    artist

  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end
end
