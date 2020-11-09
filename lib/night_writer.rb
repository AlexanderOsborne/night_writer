require './lib/io'
require './lib/translator'

class NightWriter
  attr_reader :io,
              :to_read,
              :to_write

  def initialize
    @io = IO.new
    @to_read = @io.to_read
    @to_write = @io.to_write
    @translator = Translator.new
  end

  def translate
    chars = @io.split_by_char
    translated = chars.map do |char|
      @translator.library[char]
    end
    first_line = translated.map do |char|
      char[0]
    end.join
    second_line = translated.map do |char|
      char[1]
    end.join
    third_line = translated.map do |char|
      char[2]
    end.join
    all_lines = first_line + "\n" + second_line + "\n" + third_line
    # require 'pry'; binding.pry

    @io.copy(all_lines)
    all_lines
  end
end

nightwriter = NightWriter.new
p nightwriter.io.output
nightwriter.translate
  
