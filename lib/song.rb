require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    # @@all << song
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(/-|\./)
    name = data[1].strip
    artist = data[0].strip
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end

  Song.create
  Song.new_by_name("Blank Space")
  Song.create_by_name("Test")
  Song.find_by_name("Hello")
  Song.find_or_create_by_name("TestA")
  song1 = Song.find_or_create_by_name("Hello")
  song2 = Song.find_or_create_by_name("Hello")
  song3 = Song.new_from_filename("Thundercat - For Love I Come.mp3")
  #binding.pry
