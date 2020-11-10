class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        song = self.new(file.split(" - ")[1])
        song.artist_name = file.split(" - ")[0]
        song
    end

    def artist_name=(name)
        Artist.all.each do |artist|
            if name == artist.name
                self.artist = artist
            end
        end
        self.artist = Artist.new(name) if self.artist.nil?
    end
    
    end