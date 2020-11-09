require './lib/io'
require './lib/translator'

class NightReader
  attr_reader :io,
              :to_read,
              :to_write,
              :lines,
              :sorted_lines

  def initialize
    @io = IO.new
    @braille_text = @io.to_read
    @english_text = @io.to_write
    @translator   = Translator.new
    @lines        = []
    @sorted_lines = []
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

 # def by_line(text)
  #   lines = text.split("\n")
  #   results = ""
  #   lines.each do |line| #40 chars of english
  #     line.each_char do |c|
  #       results << @translator.library[c][0]
  #     end
  #     results << "\n"
  #     line.each_char do |c|
  #       results << @translator.library[c][1]
  #     end
  #     results << "\n"
  #     line.each_char do |c|
  #       results << @translator.library[c][2]
  #     end
  #     results << "\n"
  #     end
  #     # require 'pry'; binding.pry
  #   results
  # end