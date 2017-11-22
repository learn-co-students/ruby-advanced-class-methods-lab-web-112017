class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end




  # def initialize(name, artist = "unknown")
  #   @name = name
  #   @artist_name = artist
  # end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name= name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |x,y|
      x.name <=> y.name
    end
  end




  def self.new_from_filename(filename)
    vars = filename.split(" - ")
    new_song = self.new
    new_song.artist_name= vars[0]
    vars = vars.last.split(".")
    new_song.name= vars.first
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end




  def save
    self.class.all << self
  end

end
