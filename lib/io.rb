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

    def copy(text)
      @braille.write(text)
      @braille.close
    end

    def split_by_char
      text = File.read(@incoming_text)
      group_by_40.split("")
    end

    # def group_by_40_chars
    #   split_by_char.each_slice(40).map(&:join).join('\n')
    # end

    def group_by_40
      text = File.read(@incoming_text)
      
      counter = 1
      holder = ""
      text.each_char do |c|
        holder << c
      if counter % 40 == 0 
        # require 'pry'; binding.pry
        holder << "\n"
      end
      counter += 1
      end
      holder
    end
end
