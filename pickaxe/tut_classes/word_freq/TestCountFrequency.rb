require_relative 'count_frequency'
require 'minitest/autorun' #require 'test/unit'에서 변경됨

class TestCountFrequency < Minitest::Test #Test::TestCase 에서 변경됨
#정의된 메소드들 중 test로 시작하는 모든 메소드는 테스트 프레임워크에 의해 자동으로 실행된다.
  def test_empty_list
    assert_equal({}, count_frequency([]))
  end

  def test_single_word
    assert_equal({"cat" => 1}, count_frequency(["cat"]))
  end

  def test_two_different_word
    assert_equal({"cat" => 1, "sat" => 1}, count_frequency(["cat", "sat"]))
  end

  def test_two_words_with_adjacent_repeat
    assert_equal({"cat" => 2, "sat" => 1}, count_frequency(["cat", "cat", "sat"]))
  end

  def test_two_words_with_non_adjacent_repeat
    assert_equal({"cat" => 2, "sat" => 1}, count_frequency(["cat", "sat", "cat"]))
  end
end
