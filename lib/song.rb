require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new(song)
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new(song_name)
    song
  end

    def self.create_by_name(song_name)
      song = self.new(song_name)
      self.all << song
      song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song_name == song.name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else 
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    artist_and_song = file_name.split(" - ")
    song_name = artist_and_song[1].split(".")[0]
    artist = artist_and_song[0]

    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end


  def self.create_from_filename(file_name)
    artist_and_song = file_name.split(" - ")
    song = artist_and_song[1].split(".")[0]
    artist = artist_and_song[0]

    new_song = self.create_by_name(song)
    new_song.artist_name = artist_and_song[0]
  end

  def self.destroy_all
    self.all.clear
  end
end


Song.create_by_name("baby")
Song.create_by_name("axx")
Song.new_from_filename("Thundercat - For Love I Come.mp3")