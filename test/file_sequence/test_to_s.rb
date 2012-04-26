require 'test/unit'
require_relative '../../app/file_sequence.rb'

class TestToS < Test::Unit::TestCase
  

  def test_should_return_4_file01_percent_04d_rgb_40_43
    sequence = FileSequence.new("file01_0040.rgb")
    file_list = ["file01_0041.rgb","file01_0042.rgb","file01_0043.rgb"]
    file_list.each { |file|  sequence << file}
    assert_equal("4 file01_%04d.rgb 0040-0043",sequence.to_s)
  end
  
  def test_should_return_3_file03_percent_d_rgb_1_3
    sequence = FileSequence.new("file03_1.rgb")
    file_list = ["file03_2.rgb","file03_3.rgb"]
    file_list.each { |file|  sequence << file}
    assert_equal("3 file03_%d.rgb 1-3",sequence.to_s)
  end
  
  def test_should_return_4_file_02_percent_04d_rgb_44_47
    sequence = FileSequence.new("file02_0044.rgb")
    file_list = ["file02_0045.rgb","file02_0046.rgb","file02_0047.rgb"]
    file_list.each { |file|  sequence << file}
    assert_equal("4 file02_%04d.rgb 0044-0047",sequence.to_s)
  end
  
  def test_should_return_a_txt
    sequence = FileSequence.new("a.txt")
    assert_equal("1 a.txt",sequence.to_s)
  end
  
  def test_should_return_1_file03_info_txt
    sequence = FileSequence.new("file03_info.txt")
    assert_equal("1 file03_info.txt",sequence.to_s)
  end
  
end