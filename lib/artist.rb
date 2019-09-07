class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []  #each class should contain a class variable @@all that is set to an empty array and is prepared to store all saved instances of the class. 

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all 
  end

  def self.destroy_all #class should be able to empty its @@all array via a class method .destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
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
