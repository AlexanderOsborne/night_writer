class IO
    attr_reader :to_read,
                :to_write,
                :incoming_text,
                :output_text,
                :text,
                :incoming_text
    
    def initialize(inputfile, outputfile)
      @to_read = inputfile
      @to_write = outputfile
    end

    def read
      @incoming_text = File.open(@to_read, 'r')
      @text = File.read(@incoming_text).downcase
    end

    def word_count
      split_by_char.length
    end

    def output
      read
      "Created #{@to_write}" + " containing #{word_count} characters"
    end

    def copy(text)
      @output_text = File.new(@to_write, "w")
      @output_text.write(text)
      @output_text.close
    end

    def split_by_char
      group_by_40.split("")
    end

    def group_by_40
      counter = 1
      holder = ""
      @text.each_char do |c|
        holder << c
      if counter % 40 == 0 
        holder << "\n"
      end
      counter += 1
      end
      holder
    end
end
