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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name_of_song)
    song = self.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = self.create
    song.name = name_of_song
    song
  end

  def self.find_by_name(name_of_song)
    self.all.detect{|each_song| each_song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
    self.find_by_name(name_of_song) || self.create_by_name(name_of_song)
  end

  def self.alphabetical
    self.all.sort_by{|each_song| each_song.name}
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
      self.all.clear
    end
end
