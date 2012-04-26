class FileSequence
  
  def initialize(file_name)
    @ext = file_name[file_name.rindex(".")+1..file_name.length] if !file_name.nil?
    @file_name = transform(file_name) if !file_name.nil?
  end
  
  def file_name
    @file_name
  end
  
  def falls_in_sequence?(file_name)
    @file_name == (transform(file_name))
  end
  
private

  def transform(file_name)
    sequence_number = extract_sequence_number(file_name)
   if !sequence_number.nil?
     file_name=file_name.sub(/#{Regexp.quote(sequence_number)}\.#{@ext}$/,"#{format(sequence_number)}.#{@ext}")
   end
   file_name
  end
  
  def extract_sequence_number(file_name)
    numbers_in_file_name = file_name.scan(/\d+/)
    # Numbers towards the end of the file are considered the sequence number, so replace them 
     (!numbers_in_file_name.nil? && !numbers_in_file_name.empty?)  ? numbers_in_file_name.last : nil
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
  
  
end