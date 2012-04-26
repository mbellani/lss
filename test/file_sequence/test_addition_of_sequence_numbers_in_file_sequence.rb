require 'test/unit'
require_relative '../../app/file_sequence.rb'

class TestAdditionOfSequenceNumbersInFileSequence < Test::Unit::TestCase

  def test_should_have_101_and_102_in_sequences
    sequence = FileSequence.new("sd_fx29.0102.rgb")
    sequence << "sd_fx29.0101.rgb"
    assert_equal(true,sequence.numbers.include?("0101"), "sequence numbers should have included 0101")
    assert_equal(true,sequence.numbers.include?("0102"), "sequence numbers should have included 0102")
  end

  def test_should_have_1_through_5_in_sequences
    two_through_five = (2..5)
    sequence = FileSequence.new("file01_0001.rgb")
    two_through_five.each { |n|  sequence << "file01_000#{n}.rgb"}
    (1..5).each do |n|
      assert_equal(true,sequence.numbers.include?("000#{n}"), "sequence numbers should have included 000#{n}")
    end
  end

  def test_should_not_add_sequence_when_file_name_does_not_fall_in_sequence
    sequence = FileSequence.new("sd_fx29.0102.rgb")
    sequence << "file01_0042.rgb"
    assert_equal(false,sequence.numbers.include?("0042"), "sequence numbers should not have included 0042")
    assert_equal(true,sequence.numbers.include?("0102"), "sequence numbers should have included 0102")
  end

  def test_should_not_increa_sequence_count_when_adding_file_without_sequence_nubers
    sequence = FileSequence.new("sd_fx29.0102.rgb")
    sequence << "a.txt"
    assert_equal(1,sequence.numbers.length, "Adding a.txt to the sequence should not have altered the count of sequences")
  end

end
