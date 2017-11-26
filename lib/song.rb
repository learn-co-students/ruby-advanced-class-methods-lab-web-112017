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
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    created_song = self.new
    created_song.name = name
    @@all << created_song
    created_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename (filename)
    song_split = filename.split(/[-.]/)
    name = song_split[1][1..-1]
    artist = song_split[0][0..-2]
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename (filename)
    song_split = filename.split(/[-.]/)
    name = song_split[1][1..-1]
    artist = song_split[0][0..-2]
    song = self.new
    song.name = name
    song.artist_name = artist
    @@all << song 
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
