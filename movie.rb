class MovieChoice

  def initialize(movie_path)

    if File.exist?(movie_path)
      f = File.new(movie_path, "r:UTF-8")

      @title = f.readline.chomp
      @director = f.readline.chomp
      @date = f.readline.chomp

      f.close
    else
      raise "Can't find any file"
    end

  end

  def director
    return @director
  end

  def movie_info
    return @title + " - " + @director + " " + "(#{@date})"
  end

end
