class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        file_names = Dir.glob(self.path + "/*.mp3")
        return file_names.each { |file| file.slice! (self.path + "/")}
    end

    def import
        self.files.each { |song| Song.new_by_filename(song) }
    end

end