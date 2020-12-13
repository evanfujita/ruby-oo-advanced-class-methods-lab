
class Song
  attr_accessor :song, :name, :artist_name
  attr_reader :song

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @name = name
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
      
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    artist = filename.split(" - ")
    song.artist_name = artist[0]
    name = artist[1].split(".mp3")
    #inding.pry
    song.name = name[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = [ ]
  end

end