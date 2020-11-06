class CLI
    attr_reader :to_read,
                :to_write
    
    def initialize
        @to_read = nil
        @to_write = nil
    end

    def get_args
        # require 'pry'; binding.pry
        @to_read = ARGV[0]
        @to_write = ARGV[1]
    end

    def output
        # require 'pry'; binding.pry
        "Created #{@to_write}" + " containing 256 characters"
    end
end

#1 take two arguments (1, what file we want to read) (2, what file we want to create)
    # create a function to get user arguments(1 and 2) (request)
        # if invalid prompt again
    # find the file(first argument), open file and pass string to translator
        #will be translated to braille
 #2 print file name and length(static) to command line