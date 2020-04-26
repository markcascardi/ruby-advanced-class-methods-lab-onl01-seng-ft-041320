class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create()
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
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    create_by_name(name) unless find_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_from_file)
    file_data = song_from_file.delete_suffix(".mp3").split(" - ")
    song = new_by_name(file_data[1])
    song.artist_name = file_data[0]
    song
  end

  def self.create_from_filename(song_from_file)
    new_from_filename(song_from_file).save
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end
