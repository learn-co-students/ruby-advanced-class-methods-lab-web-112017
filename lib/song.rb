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

  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
     song = self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect {|s| s.name==song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name }
  end

  def self.new_from_filename(file)
    parts = file.split(' - ')
    new_song = self.new
    new_song.name = parts[1][0..-5]
    new_song.artist_name = parts[0]
    new_song
  end

  def self.create_from_filename(file)
    parts = file.split(' - ')
    new_song = self.create_by_name(parts[1][0..-5])
    new_song.artist_name = (parts[0])
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
