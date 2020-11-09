class IO
    attr_reader :to_read,
                :to_write,
                :incoming_text,
                :output_text
    
    def initialize
      @to_read = ARGV[0]
      @to_write = ARGV[1]
      @incoming_text = File.open(@to_read, 'r')
      @output_text = File.new(@to_write, "w")
    end

    def word_count
      split_by_char.length
    end

    def output
      "Created #{@to_write}" + " containing #{word_count} characters"
    end

    def copy(text)
      @output_text.write(text)
      @output_text.close
    end

    def split_by_char
      text = File.read(@incoming_text)
      group_by_40.split("")
    end

    def group_by_40
      text = File.read(@incoming_text)

      counter = 1
      holder = ""
      text.each_char do |c|
        holder << c
      if counter % 40 == 0 
        holder << "\n"
      end
      counter += 1
      end
      holder
    end
end
