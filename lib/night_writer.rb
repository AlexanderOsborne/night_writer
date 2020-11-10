require './lib/io'
require './lib/translator'

class NightWriter
  attr_reader :inputfile,
              :outputfile,
              :io

  def initialize(inputfile, outputfile)
    @io = IO.new(inputfile, outputfile)
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

nightwriter = NightWriter.new(ARGV[0], ARGV[1])
p nightwriter.start
nightwriter.translate
