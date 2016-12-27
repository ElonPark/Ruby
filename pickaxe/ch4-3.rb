# for i in 0..4
#   word = top_five[i][0]
#   count = top_five[i][1]
#   puts "#{word}: #{count}"
# end
# 위 코드는 반복이 5번만 일어나고 배열의 순서대로 값을 가져와야 한다 심지어 처리하는 대상의 구조가 요소 두 개를 가진 서브배열들의 배열이라는 사실이다.모든것이 지나치게 결합되어 있다.

# 앞의 코드와 같은 일을 하는 코드를 다음과 같이 작성할 수도 있다.
# top_five.each do |word, count| #each 메소드는 반복자라고 불리며 주어진 블록의 코드를 반복적으로 호출한다.
#   puts "#{word}: #{count}"
# end
# 더 나아가 다음과 같이 더 간결한 코드를 작성하는 프로그래머도 있다.
# puts top_five.map { |word, count| "#{word}: #{count}" }

# 블록
# 블록은 중괄호나 do와 end 키워드로 둘러싸인 코드 덩어리다.
# 바로 앞에서 살펴본 두 가지 방법은 연산자 우선순위를 제외하면 완전히 같다.
# 어느쪽을 사용해도 결과는 같지만 루비 프로그래머들은 일반적으로 한 줄에 블록을 작성할 수 있다면
# 중괄호를 사용하고, 그렇지 않으면 do/end 블록을 사용한다.
 # some_array.each {|value| puts value * 3}

 # sum = 0
 # other_array.each do |value|
 #   sum += value
 #   puts value / sum
 # end
# 블록은 익명 메소드의 본문과 비슷한 무언가라고 생각해도 무방하다.
# 메소드와 마찬가지로 블록도 매개 변수를 받을 수 있다(단, 메소드와 달리 넘겨받는 매개 변수를 표현할 때
# 블록의 시작 부분에 두 개의 막대(|) 사이에 이름을 넣어준다.)
# 또한 메소드와 마찬가지로 블록은 루비가 처음 이부분을 해석하는 동안에는 실행되지 않는다.
# 실행하는 대신 이후에 호출할 수 있도록 블록을 저장해 둔다.

# 루비 소스 코드에서 블록은 반드시 메소드 호출 바로 다음에 위치해야한다.
# 메소드가 매개변수를 받는다면 블록은 이들 매개 변수에 이어진다. 다르게 생각해 보면 블록은
# 메소드에 넘겨지는 추가적인 매개변수라고 봐도 무방하다.
# sum = 0
# [1,2,3,4].each do |value; square|
#     square = value * value #앞에 정의한 square와는 다른 변수다.
#     sum += square
# end
#   puts sum
# 블록은 각 배열 요소에 대해 한 번씩 호출된다. 각 요소는 값 매개 변수로 블록에 전달된다.
# 여기서 주의해야 할 부분이 있다. 앞선 예제에서 sum변수에 주목해보자.
# 이 변수는 블록 밖에서 정의되어 있으며, 블록 안에서 갱신되고 each메소드가 종료된 뒤에 메소드에 넘겨진다.


# value = "some shape"
# [ 1, 2 ].each { |value| puts value }
# puts value

# square = "some shape"
# sum = 0
# [1,2,3,4].each do |value; square|
#     square = value * value #앞에 정의한 square와는 다른 변수다.
#     sum += square
# end
#   puts sum
#   puts square
# square 변수를 지역 변수로 만들어 블록 내에서 변수를 대입하더라도 블록 밖의 스코프에 존해는 같은 이름의
# 변수에는 영향을 주지 않는다.

# 반복자
# 루비에서 반복자란 코드 블록을 호출할 수 있는 메소드를 이야기 한다.
# 메소드에서 yield문을 사용해서 마치 코드 블록을 하나의 메소드인 걱처럼 호출할 수 있다.
# yield를 사용하면 메소드 안에거 언제라도 코드 블록을 호출할 수 있다.
# 블록이 끝나면  yield문 바로 다음 부터 메소드가 실행된다.
# def two_times
#     yield
#     yield
#   end
#
#   two_times { puts "Hello"}

def fib_up_to(max)
  i1, i2, = 1, 1 #벙렬 대입 { i1 = , i2 = 1 }
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

fib_up_to(1000) {|f| print f,  " "}
puts
