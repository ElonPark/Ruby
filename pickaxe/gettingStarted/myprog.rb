#!/usr/bin/ruby

# puts "Hello, Ruby Programmer"
# puts "It is now #{Time.now}"

# 구문 변경자. 실행될 코드를 쓰고, 그 뒤에 if나 while과 조건문을 써주면 된다.
# radidtion = 3001
# if radidtion > 3000
#   puts "Danger, Wil Robinse"
# end
#
# #위 예제를 한 줄로 쓰면
# puts "Danger, Wil Robinse" if radidtion > 3000
#
# #while에서 사용하면
# square = 4
# while square < 1000
#   square = square * square
# end
# #구문 변경자 사용
# square = 4
# square = square * square while square < 1000
# p "square = #{square}"

# 정규 표현식
# 정규 표현식은 문자열에 매치되는 패턴을 기술하는 방법이다.
# 루비에서는 슬래시 사이에 패턴을 적으면 정규 표현식을 의미한다.(/pattern/).
# 루비이기 때문에 정규표현식 또한 객체이고, 사용법도 다른 객체와 별반 다르지 않다.

# /Perl|Python/ #Perl이나 Python을 포함하는 문자열을 찾는 패턴
# /ab+c/ #a가 하나 오고, 그 뒤에 1개 이상의 b가 오고, 이어서 c가 오는 문자열을 나타낸다.
# /ab*c/ #a가 하나 오고, b가 없거나 여러개, 이어서 c 하나가 오는 문자열을 나타낸다.

#\s는 공백 문자(스페이스, 탭, \n 등)를 나타내고, \d는 숫자, \w는 일반적인 단어에서 쓰이는 문자를 나타낸다.
# 마침표(.)는 아무 글자나 한 글자를 의미한다.

# /\d\d\:\d\d:\d\d/ # 12:00:00 형태의 시간
# /Perl.*Python/ #Perl, 0개 이상의 문자들, 그리고 Python
# /Perl Python/  #Perl, 공백, Python
# /Perl *Python/ #Perl, 0개 이상의 공백, 그리고 Python
# /Perl +Python/ #Perl, 1개 이상의 공백, 그리고 Python
# /Perl\s+Python/ #Perl, 1개 이상의 공백 문자, 그리고 Python
# /Ruby (Perl|Python)/ #Ruby, 공백, 그리고 Perl이나 Python


# 매치 연산자 =~는 특정 문자열이 정규 표현식과 매치되는지 검사하는지 사용한다.
# 이 연산자는 문자열에서 팬턴이 발견되면 발견된 첫 위치를 반환하고, 그렇지 않으면 nil을 반환한다.
# 정규 표현식도 if문이나 while문 등에서 조건식으로 사용할 수 있다.

# 문자열이 Perl이나 Python을 포함하고 있으면 메시지를 출력한다.
# line = gets
# if line =~ /Perl|Python/
#   puts "Scripting language menthioned: #{line}"
# end
#
# # 루비의 치환 메서드를 이용하면 정규 표현식으로 찾아낸 문자열의 일부를 다른 문자열로 바꿀 수 있다.
# line = gets
# newline = line.sub(/Perl/, 'Ruby') #처음 나오는 'Perl'을 'Ruby'로 바꾼다.
# newrline = newline.gsub(/Python/,'Ruby') #모든 'Python'을 'Ruby'로 바꾼다.
#
# # 문자열에서 Perl과 Python을 모두 Ruby로 바꾸려면 다음과 같이 쓰면 된다.
# line = gets
# newline = line.gsub(/Perl|Python/, 'Ruby')



#블록과 반복자
# 코드 블록은 매개변수처럼 메소드 호출과 결합할 수 있는 코드이다. 코드블록을 이용해 콜백을 구현할 수도 있고,
# 코드의 일부를 함수에 넘길 수 있고, 반복자를 구현할 수도 있다.
# 코드 블록은 중괄호나 do와 end로 묶인 코드이다.
# { puts "Hello"}
# #다음 역시 코드 블록이다.
# do
#   club.enroll(person)
#   person.socialize
# end
# # 두가지 방법이 있는 이유는 상활에 따라 더 자연스럽게 얼루기는 방식이 있기 때문이다.
# # 그리고 연산자 우선순위가 서로 다르다. 중괄호는 do/end 쌍보다 연산자 우선순위가 높다.

# # 메소드 호출과 결합하는 방법은 메소드 호출하는 소스 코드의 맨 뒷부분에 코드블록을 적어주기만 하면 된다.
# greet { puts "Hi" }
# # 메소드에 매개 변수가 있다면, 블록보다 앞에 써 준다.
# verbose_greet("Dave", "loyal customer") { puts "Hi" }
# 메소드에서는 루비의 yield문을 이용해서 결합된 코드블록을 여러 차례 실행할 수 있다.
# yield문은 yield를 포함하는 메소드에 연관된 블록을 호출하는 메소드로 생각해도 무방하다.
# 예제에서는 yield를 두 번 호출하는 메소드를 정의하고 있다. 다음으로 이 메소드를 호출하고
# 같은 줄에 블록을 넘겨준다(메소드에 매개 변수에 있다면 그 다음에 넘겨준다.)
def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end

call_block { puts "In the block" } #블록안에 있는 코드는 yield가 불릴 때마다 한 번씩 실행된다.

# yield문에 인자를 적으면 코드 블록에 이 값이 매개 변수로 전달된다. 블록 안에서 이러한 매개 변수를 넘겨받기
# 위해 |params|와 같이 세로 막대 사이에 매개 변수 이름들을 정의한다.

# 다음 예제는 메소드가 넘겨받은 블록은 2회 호출하고, 이때 블록에 인자를 넘겨준다.
def who_says_what
  yield("Dave", "hello")
  yield("Andy", "goodbye")
end

who_says_what { |person, phrase| puts "#{person} says #{phrase}" }

# 루비 라이블러리에서는 코드 블록을 반복자 구현에 사용하기도 한다. 반복자란 배열 등의 집합에서 구성요소를
# 하나씩 반환해 주는 함수를 의미한다.
animals = %w( ant bee cat dog ) #배열을 하나 만든다.
animals.each {|animals| puts animals}  #배열의 내용을 반복한다.

# c나 자바에서 기본으로 지원하는 반복(제어)문은 루비에서는 단순히 메소드 호출일 뿐이다.
# 이 메소드는 결합된 블록을 여러 차례 반복 수행한다.

#배열에 대해 각 요소를 블록에 넘겨준다.
['cat', 'dog', 'horse'].each { |name| print name, " " }

#숫자 객체 5에 대해 블록을 다섯 번 호출한다.
5.times {print "*"}

#for문을 사용하지 않고 숫자 3 객체가 6이 될 때까지 증가하면서 코드 블록을 수행하라고 메시지를 보낸다.
3.upto(6) {|i| print i}

#a에서 e까지의 범위 가가에 대해 블록을 실행한다.
('a'..'e').each { |char| print char }
puts


#읽기와 쓰기
# puts는 줄 바꿈 문자를 문자열 끝 부분에 더해서 출력 해주고, print는 줄 바꿈 문자없이 문자열만 출력해준다.
# printf는 매개 변수를 특정 형식 문자열에 따라서 제어하여 출력해 준다.
printf("Number: %5.2f,\nString: %s\n", 1.23, "hello")
