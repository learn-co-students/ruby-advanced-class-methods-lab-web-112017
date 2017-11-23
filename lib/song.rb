require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    song = self.all.find {|i| i.name == title}
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    !song ? (self.create_by_name(title)) : song
  end

  def self.alphabetical
    self.all.each.with_index do |s, i|
      if self.all[i].name[0] < self.all[i-1].name[0]
        self.all[i], self.all[i-1] = self.all[i-1], self.all[i]
      end
    end
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.create_by_name(song_array[1][0..-5])
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song = self.create_by_name(song_array[1][0..-5])
    song.artist_name = song_array[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
