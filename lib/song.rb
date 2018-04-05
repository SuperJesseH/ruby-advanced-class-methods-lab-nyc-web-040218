
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    a_song = self.new()
    @@all << a_song
    a_song
  end

  def self.new_by_name(song_name)
    a_song = self.new()
    a_song.name = song_name
    a_song
  end

  def self.create_by_name(song_name)
    a_song = self.new()
    a_song.name = song_name
    self.all << a_song
    a_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song_components = file_name.split("-")
    a_song = self.new()
    a_song.name = song_components[1].sub(".mp3","").strip
    a_song.artist_name = song_components[0].strip
    a_song
  end

  def self.create_from_filename(file_name)
    song_components = file_name.split("-")
    a_song = self.new()
    a_song.name = song_components[1].sub(".mp3","").strip
    a_song.artist_name = song_components[0].strip
    self.all << a_song
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
