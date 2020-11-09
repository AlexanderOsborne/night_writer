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
    filecontents = @io.group_by_40
    output = by_line(filecontents)
    @io.copy(output)
    output #for testing
  end

  def by_line(text)
    lines = text.split("\n")
    results = ""
    lines.each do |line| #40 chars of english
      line.each_char do |c|
        results << @translator.library[c][0]
      end
      results << "\n"
      line.each_char do |c|
        results << @translator.library[c][1]
      end
      results << "\n"
      line.each_char do |c|
        results << @translator.library[c][2]
      end
      results << "\n"
      end
    results
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
#   end
# end

# def all_lines
#   # require 'pry'; binding.pry
#   all_lines = first_line + "\n" + second_line + "\n" + third_line
# end

#   def first_line
#     first_line = mapped_chars.map do |char|
#       char[0]
#     end.join
#   end

#   def second_line
#     second_line = mapped_chars.map do |char|
#       char[1]
#     end.join
#   end

#   def third_line
#     third_line = mapped_chars.map do |char|
#       char[2]
#     end.join
#   end