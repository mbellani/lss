require "set"
require_relative 'file_sequence'
class LssParser
  def initialize(input)
    @input=input
  end

  def parse
    map = Hash.new
    @input.split.each do |file|
      sequence = FileSequence.new(file)
      if map[sequence.file_name].nil?
        map[sequence.file_name]=sequence 
      else
        map[sequence.file_name] <<file
      end
    end
    generate_output(map)
  end
  
  def generate_output(map)
    output=""
    map.each { |key,sequence| output+=sequence.to_s+"\n" }  
    output.chomp
  end
end



