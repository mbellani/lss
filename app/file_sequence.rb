class FileSequence
  
  def initialize(file_name)
    transform(file_name) if !file_name.nil?
  end
  
  def transform(file_name)
    @file_name=file_name
    @ext = @file_name[@file_name.rindex(".")+1..@file_name.length]
    numbers_in_file_name = @file_name.scan(/\d+/)
   if !numbers_in_file_name.nil? && !numbers_in_file_name.empty?
     # Numbers towards the end of the file are considered the sequence number, so replace them 
     sequence_number = numbers_in_file_name.last
     @file_name=@file_name.sub(/#{Regexp.quote(sequence_number)}\.#{@ext}$/,"#{format(sequence_number)}.#{@ext}")
   end
  end
  
  def format(sequence_number)
    length_of_sequence_number=sequence_number.length
    if length_of_sequence_number==1
     "%d"   
    elsif length_of_sequence_number < 10   
      "%0#{length_of_sequence_number}d"
    else
      "%#{length_of_sequence_number}d"
    end
  end
  
  def file_name
    @file_name
  end
  
end