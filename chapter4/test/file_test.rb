require 'test/unit'

class FileReaderTest < Test::Unit::TestCase
  def test_read_4th_character
    contents = File.read('chapter4/test/fixtures/sample.txt')
    assert_equal 'd', contents[3, 1]
  end
end
