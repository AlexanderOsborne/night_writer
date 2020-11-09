require './lib/io'
require './lib/translator'

class NightReader
  attr_reader :io,
              :to_read,
              :to_write,
              :lines,
              :sorted_lines,
              :scanned_lines

  def initialize
    @io = IO.new
    @braille_text  = @io.to_read
    @english_text  = @io.to_write
    @translator    = Translator.new
    @lines         = []
    @sorted_lines  = []
    @scanned_lines = []
  end
  
  def start
    @io.output
  end

  def lines
    @lines = IO.readlines(@braille_text, chomp:true)
  end

  def sort_lines
    top = ""
    mid = ""
    bot = ""
    @lines.each do |line|
      if @lines.index(line) % 3 == 0
        top += line
      elsif @lines.index(line) % 3 == 1
        mid += line
      else @lines.index(line) % 3 == 2
        bot += line
      end
      @sorted_lines << top
      @sorted_lines << mid
      @sorted_lines << bot
    end
  end 
end

nightreader = NightReader.new
p nightreader.start