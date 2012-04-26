require 'test/unit'
require_relative '../../app/file_sequence.rb'

class TestFileNameScenariosInFileSequences < Test::Unit::TestCase
  
  def test_should_return_a_file_name
    file_name="sd_fx29.101.rgb"
    @sequence = FileSequence.new(file_name)
    assert_not_nil(!@sequence.file_name, "File name should not be null")
  end
  
  def test_when_created_with_file_name_sd_fx29_101_rgb
    @sequence = FileSequence.new("sd_fx29.101.rgb")
    assert_equal("sd_fx29.%03d.rgb",@sequence.file_name, "File name should have been sd_fx29.%03d.rgb")
  end

  
  def test_when_created_with_file_name_sd_fx29_0101_rgb
    @sequence = FileSequence.new("sd_fx29.0101.rgb")
    assert_equal("sd_fx29.%04d.rgb",@sequence.file_name, "File name should have been sd_fx29.%04d.rgb")
  end
  
  def test_when_created_with_file_name_file01_0040_rgb
    @sequence = FileSequence.new("file01_0040.rgb")
    assert_equal("file01_%04d.rgb",@sequence.file_name, "File name should have been file01_%04d.rgb")
  end
  
  def test_when_created_with_file_name_file01_1_rgb
    @sequence = FileSequence.new("file01_1.rgb")
    assert_equal("file01_%d.rgb",@sequence.file_name, "File name should have been file01_%d.rgb")
  end
  
  def test_when_created_with_file_name_sample_txt
    @sequence = FileSequence.new("sample.txt")
    assert_equal("sample.txt",@sequence.file_name, "File name should have been file01_%d.rgb")
  end
  
  def test_when_created_with_nil_file_name
    @sequence = FileSequence.new(nil)
    assert_equal(nil,@sequence.file_name, "File name should have been file01_%d.rgb")
  end
  
end