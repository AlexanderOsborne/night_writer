class CLI
    attr_reader :to_read,
                :to_write
    
    def initialize
      @to_read = nil
      @to_write = nil
    end

    def get_args
      @to_read = ARGV[0]
      @to_write = ARGV[1]
    end

    def output
      "Created #{@to_write}" + " containing #{word_count} characters"
    end
    
    def create_file
       braille = File.new(@to_write, "w")
    end

    def word_count
      text = File.open(@to_read, 'r')
      number_of_words = 0
      text.each_line() do |line|
        number_of_words += line.split.size
      end
      number_of_words
    end
end
