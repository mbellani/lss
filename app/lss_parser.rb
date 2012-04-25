require "set"
class LssParser
  def initialize(input)
    @input=input
  end

  def parse
    output_repository = Hash.new();
    output= ""
    files = @input.split
    files.each do |file|
     if file_name_contains_digits(file)
       file_prefix = file[0..file.index(".")-1]
       output_repository[file_prefix]  = SortedSet.new if output_repository[file_prefix].nil?
       output_repository[file_prefix] << file[file.index(".")+1..file.rindex(".")-1] 
     else
        output_repository[file] =  nil
     end
    end
    output_repository.each do |file_prefix,sequences|
      if !sequences.nil? 
        seq_array = sequences.to_a
        output +="#{seq_array.length} #{file_prefix}.%04d.rgb #{seq_array[0]}-#{seq_array[seq_array.length-1]}\n"
      else
        output+="1 #{file_prefix}\n"
      end
    end
    output.chomp
  end  
  
   def file_name_contains_digits(file_name)
     !(file_name =~ /\d+/).nil? 
   end
  
end
  