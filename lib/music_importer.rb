class MusicImporter
  attr_reader :path

  def initialize(path)# accepts a file path to parse MP3 files from #path
    @path = path #path retrieves the path provided to the MusicImporter object
  end

  def files #path ,loads all the MP3 files in the path directory
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import #import the files into the library by invoking Song.create_from_filename
    files.each{ |f| Song.create_from_filename(f) }
  end
end
