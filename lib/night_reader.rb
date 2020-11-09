require './lib/io'
require './lib/translator'

class NightReader
  attr_reader :io,
              :to_read,
              :to_write,
              :lines,
              :sorted_lines,
              :scanned_lines,
              :braille_hash

  def initialize
    @io = IO.new
    @braille_text  = @io.to_read
    @english_text  = @io.to_write
    @translator    = Translator.new
    @lines         = []
    @sorted_lines  = []
    @scanned_lines = []
    @braille_hash  = Hash.new
  end
  
  def start
    @io.output
  end

  def lines
    @lines = File.read(@braille_text).split("\n")
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
    end
    @sorted_lines << top
    @sorted_lines << mid
    @sorted_lines << bot
  end 

  def line_by_char
    @sorted_lines.each do |line|
      @scanned_lines << line.scan(/../)
    end
    @scanned_lines
  end

  def index_hash
    key = 0
    @scanned_lines[0].each do |group|
      @braille_hash[key] = group + ","
      key += 1
    end
    key = 0
    @scanned_lines[1].each do |group|
      @braille_hash[key] += group + ","
      key += 1
    end
    key = 0
    @scanned_lines[2].each do |group|
      @braille_hash[key] += group
      key += 1
    end
    @braille_hash
    require 'pry'; binding.pry
  end
end

nightreader = NightReader.new
p nightreader.start