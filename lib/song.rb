require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    new_song = self.new
    info = file.chomp(".mp3").split(" - ")
    new_song.artist_name = info[0]
    new_song.name = info[1]
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end

end

# song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
#
# binding.pry
