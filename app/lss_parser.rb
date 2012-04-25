require "set"
class LssParser
  def initialize(input)
    @input=input
  end

  def parse
    output_repository = Hash.new();
    output=""
    files = @input.split
    files.each do |file|
      file_prefix = file[0..file.index(".")-1]
      output_repository[file_prefix]  = SortedSet.new if output_repository[file_prefix].nil?
      output_repository[file_prefix] << file[file.index(".")+1..file.rindex(".")-1] 
    end
    output_repository.each do |file_prefix,sequences|
      seq_array = sequences.to_a
      output+="#{files.length} #{file_prefix}.%04d.rgb #{seq_array[0]}-#{seq_array[seq_array.length-1]}"
    end
    output
  end  
  
end
  