require 'test/unit'
require_relative '../../app/file_sequence.rb'

class TestSequenceIdentificationInFileSequence < Test::Unit::TestCase

  
  def test_should_consider_sd_fx_29_0102_rgb_in_sequence
    file_sequence = FileSequence.new("sd_fx29.0101.rgb")
    assert_equal(true,file_sequence.falls_in_sequence?("sd_fx29.0102.rgb"))
  end
  
  def test_should_consider_sd_fx_29_0105_rgb_in_sequence
    file_sequence = FileSequence.new("sd_fx29.0101.rgb")
    assert_equal(true,file_sequence.falls_in_sequence?("sd_fx29.0105.rgb"))
  end
  
  def test_not_should_consider_file03_2_rgb_in_sequence
    file_sequence = FileSequence.new("sd_fx29.0101.rgb")
    assert_equal(false,file_sequence.falls_in_sequence?("file03_2.rgb"))
  end
  
  def test_not_should_consider_sd_fx_29_101_rgb_in_sequence
    file_sequence = FileSequence.new("sd_fx29.0101.rgb")
    assert_equal(false,file_sequence.falls_in_sequence?("sd_fx29.101.rgb"))
  end
  
  def test_should_consider_file01_0042_rgb_in_sequence
    file_sequence = FileSequence.new("file01_0040.rgb")
    assert_equal(true,file_sequence.falls_in_sequence?("file01_0042.rgb"))
  end
  
  def test_should_not_consider_a_txt_in_sequence
    file_sequence = FileSequence.new("file01_0040.rgb")
    assert_equal(false,file_sequence.falls_in_sequence?("a.txt"))
  end
  
  
  
end