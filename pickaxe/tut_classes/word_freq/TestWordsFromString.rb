require_relative 'words_from_string'
require 'minitest/autorun' #require 'test/unit'에서 변경됨

class TestWordsFromString < Minitest::Test #Test::TestCase 에서 변경됨
#정의된 메소드들 중 test로 시작하는 모든 메소드는 테스트 프레임워크에 의해 자동으로 실행된다.
  def test_empty_string
    assert_equal([], words_from_string(""))
    assert_equal([], words_from_string("    "))
  end

  def test_single_word
    assert_equal(["cat"], words_from_string("cat"))
    assert_equal(["cat"], words_from_string("  cat  "))
  end

  def test_many_word
    assert_equal(["the", "cat", "sat", "on", "the", "mat"], words_from_string("the cat sat on the mat"))
  end

  def test_ignores_punctuation
    assert_equal(["the", "cat's", "mat"], words_from_string("<the!> cat's, -mat-"))
  end
end
