class TextAnalyzer
  def process
    File.open(ARGV[0], 'r') do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} sentences" }
analyzer.process { |file| puts "#{file.split(' ').count} words" }
