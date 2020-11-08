class IO
    attr_reader :to_read,
                :to_write,
                :text,
                :braille
    
    def initialize
      @to_read = ARGV[0]
      @to_write = ARGV[1]
      @incoming_text = File.open(@to_read, 'r')
      @braille = File.new(@to_write, "w")
    end

    def word_count
      split_by_char.length
    end

    def output
      "Created #{@to_write}" + " containing #{word_count} characters"
    end

    def copy
      text = File.read(@incoming_text)
      @braille.write(text)
      @braille.close
    end

    def split_by_char
      text2 = File.read(@incoming_text)
      text2.each_line.flat_map do |line|
        line.split("")
      end
    end   
end
