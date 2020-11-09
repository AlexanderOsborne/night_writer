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
    @io.copy(all_lines)
    all_lines
  end

  def mapped_chars
  chars = @io.split_by_char
  translated = chars.map do |char|
    @translator.library[char]
    # require 'pry'; binding.pry
  end
end

  def first_line
    first_line = mapped_chars.map do |char|
      char[0]
    end.join
  end

  def second_line
    second_line = mapped_chars.map do |char|
      char[1]
    end.join
  end

  def third_line
    third_line = mapped_chars.map do |char|
      char[2]
    end.join
  end

  def all_lines
    all_lines = first_line + "\n" + second_line + "\n" + third_line
  end

  def start
    @io.output
  end
end

nightwriter = NightWriter.new
p nightwriter.start
nightwriter.translate

# def mapped_chars
#   chars = @io.split_by_char
#   translated = chars.map do |char|
#     @translator.library[char]
#     # require 'pry'; binding.pry
#   end
# end