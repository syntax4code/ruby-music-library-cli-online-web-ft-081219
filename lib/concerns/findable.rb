module Concerns::Findable  #defines a module named Concerns::Findable,extends the Concerns::Findable module
  def find_by_name(name)
    self.all.detect{|s| s.name == name}
  end
#find_by_name returns (does not recreate) an existing song with the provided name if one exists in @@all
    #invokes .find_by_name instead of re-coding the same functionality
    #creates a song if an existing match is not found
    #invokes .create instead of re-coding the same functionality
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
