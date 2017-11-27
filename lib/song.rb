require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def initialize(song_name = "")
    @name = song_name
    @artist_name = ""
  end

  def self.create
    tune = Song.new
    tune.save
    tune
  end

  def self.create_by_name(song_name)
    tune = self.new_by_name(song_name)
    tune.save
    tune
  end

  def self.new_by_name(song_name)
    tune = Song.new(song_name)
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(song_name)
    self.all.detect do |song_object|
      song_object.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song_object|
      song_object.name
    end
  end

  def self.new_from_filename(file_name)
    file_array = file_name.gsub(".mp3","").split(" - ")
    artist = file_array[0]
    song_name = file_array[1]
    new_tune = self.new_by_name(song_name)
    new_tune.artist_name = artist
    new_tune
  end

  def self.create_from_filename(file_name)
    new_tune = self.new_from_filename(file_name)
    new_tune.save
    new_tune
  end

  def self.destroy_all
    self.all.clear
  end
end

# Song.new_from_filename("Thundercat - For Love I Come.mp3")
