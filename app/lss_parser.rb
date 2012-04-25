require "set"
class LssParser
  def initialize(input)
    @input=input
  end

  def parse
    generate_output_from(file_stats)
  end  
  
  private
  
  def file_stats
    file_stats = Hash.new()
    @input.split.each do |file|
     if file_name_contains_digits(file)
       file_prefix = file[0..file.index(".")-1]
       file_stats[file_prefix]  = SortedSet.new if file_stats[file_prefix].nil?
       file_stats[file_prefix] << file[file.index(".")+1..file.rindex(".")-1] 
     else
        file_stats[file] =  nil
     end
    end
    file_stats
  end
  
  def generate_output_from(file_stats)
    output=""
    file_stats.each do |file_prefix,sequences|
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
  