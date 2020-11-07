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

    def output
      "Created #{@to_write}" + " containing #{word_count} characters"
    end

    def copy
      text = @incoming_text.read
      @braille.write(text)
    end

    def word_count
      text = @incoming_text.read
      number_of_words = 0
      text.each_line do |line|
        number_of_words = line.split.length
      end
      number_of_words
    end
end
