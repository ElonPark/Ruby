def words_from_string(string)
    # string클래스에 정의된 downcase의 scan라는 메소드를 사용한다.
    #downcase 메소드는 문자열의 소문자로 변환한 결과를 반환한다.
    string.downcase.scan(/[\w']+/)
end

p words_from_string("But I didn't inhale, he said (empatically)")
