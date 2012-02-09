module Ralias
  module Color
    def colors
      { :red => 31, :green => 32, :yellow => 33, :blue => 34, :magenta => 35,
        :cyan => 36, :white => 27, :default => 39 }
    end

    def with_color(state = :default)
      puts "\e[#{colors[state]}m#{yield}\e[0m"
    end
  end
end

