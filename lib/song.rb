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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect do |song_obj|
      song_obj.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song_obj|
      song_obj.name
    end
  end

  def self.new_from_filename(song)
    name_artist_array = song.split(" - ").map {|x| x.chomp(".mp3")}
    artist_name = name_artist_array[0]
    name = name_artist_array[1]
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end 
end
