require 'test/unit'

class FileReaderTest < Test::Unit::TestCase
  def test_read_4th_character
    contents = File.read('chapter4/test/fixtures/sample.txt')
    assert_equal 'd', contents[3, 1]
  end

  def test_read_with_a_length_specified
    contents = File.read('chapter4/test/fixtures/sample.txt', 15)
    assert_equal 'Bradman 99.94 5', contents
  end

  def test_read_empty_file
    File.open('chapter4/test/fixtures/empty.txt', 'w') {}
    contents = File.read('chapter4/test/fixtures/empty.txt')
    assert_equal '', contents
  end

  def test_read_an_out_of_bounds_length_causes_no_error
    File.open('chapter4/test/fixtures/simple.txt', 'w') { |file| file << 'simple file' }
    contents = File.read('chapter4/test/fixtures/simple.txt', 100)
    assert_equal 'simple file', contents
  end

  def test_read_raises_error_when_file_no_found
    assert_raises Errno::ENOENT do
      File.read('chapter4/test/fixtures/x.txt')
    end
  end
end
