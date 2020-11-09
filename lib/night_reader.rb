require './lib/io'
require './lib/translator'

class NightReader
  attr_reader :io,
              :to_read,
              :to_write

  def initialize
    @io = IO.new
    @braille_text = @io.to_read
    @english_text = @io.to_write
    @translator = Translator.new
  end
  
  def start
    @io.output
  end

  def lines
    braille_lines = IO.readlines(@braille_text, chomp:true)
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