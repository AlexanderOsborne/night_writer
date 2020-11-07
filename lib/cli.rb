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
       braille = File.new(ARGV[1], "w")
    end

    def word_count
      text = File.open("message.txt", 'r')
      number_of_words = 0
      # require 'pry'; binding.pry
      text.each_line(){ |line| number_of_words = number_of_words + line.split.size }
      number_of_words
    end
end

#1 take two arguments (1, what file we want to read) (2, what file we want to create)
    # create a function to get user arguments(1 and 2) (request)
        # if invalid prompt again
    # find the file(first argument), open file and pass string to translator
        #will be translated to braille
 #2 print file name and length(static) to command line