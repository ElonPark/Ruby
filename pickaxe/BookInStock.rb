#3장
# class BookInStock
# end
#
# #클래스의 인스턴스 생성
# a_book = BookInStock.new
# another_book = BookInStock.new

# 생성자 메소드를 정의하면 이를 통해 객체가 생성되는 시점에 생성하고자 하는 객체에
# 특정한 상태를 저장할 수 있다. 이러한 상태는 인스턴스 변수로 저장된다.
# 루비에서는 각 객체는 자신만의 인스턴스 변수들을 가지고 있으며 이를 통해 객체 고유의 상태를 저장한다.

# 앞서 정의한 BookInStock클래스를 개선해 보자
# class BookInStock
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
#   # 루비는 객체를 문자열로 나타내는 표준 메시지인 to_s가 준비되어있다.
#   # puts에 BookInStock객체가 넘겨지면 puts는 내부적으로 넘겨받은 객체에서 to_s를 호출하고 이 결과를 출력한다.
#   def to_s
#     "ISBN: #{@isbn}, price: #{@price}"
#   end
# end

# 루비에서 initialize메소드는 생성자를 의미하는 특별한 메소드이다.
# 새로운 객체를 만들기 위해 BookInStock.new를 호출하면 루비는 초기화 되지 않은 객체를 메모리에 할당하고
# new의 매개변수를 이용해 그 객체의 initialize 메소드를 호출한다. 객체의 상태를 초기화하기에 가장 적당한 곳이다.

 # b1 = BookInStock.new("isbn1", 3)
 # p b1
 # puts b1
 #
 # b2 = BookInStock.new("isbn2", 3.14)
 # p b2
 # puts b2
 #
 # b3 = BookInStock.new("isbn3", "5.67")
 # p b3
 # puts b3
# 이러한 변수들은 각 객체에 저장되며 이 객체에 정의되는 모든 인스턴스 메소드에서 참조 가능하다.
# 일반적으로 객체 외부에서 객체 상태에 접근하거나 조작하는 메소드를 별로 정의해서 외부에서
# 객체 상태에 접근 가능도록 만들어 준다. 객체의 내부가 외부에 노출되는 부분을 객체의 속성이라고 부분다.
# 이를 구현하는 방법 중 하나는 접근자 메소드를 직접 구현하는 것이다.

# class BookInStock
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
#
#   def isbn
#     @isbn
#   end
#   def price
#     @price
#   end
# end
#
# book = BookInStock.new("isbn1", 12.34)
# puts "ISBN = #{book.isbn}"
# puts "Price = #{book.price}"

# 이 예제에서는 두 인스턴스 변수에 접근할 수 있도록 해주는 구 개의 접근자 메소드를 직접 구현 했다.
# 루비에서는 기본적으로 메서드 마지막에 평가된 표현식의 평가 결과를 반환하는데, 여기서 마지막 표현식은 단순히 인스턴스 변수의 값 자체이다.
# 접근자 메소드는 매우 자주 사용되므로, 루비는 이를 쉽게 정해 주는 편의 메소드를 제공한다.
# attr_reader메소드는 앞에서 작성한 것과 같은 접근자 메소들ㄹ 대신 생성해 줄 것이다.

# class BookInStock
#   # 심법을 단순히 아름을 참조할때 사용할 수 있는 편리한 방법이다.
#   # :isbn은 isbn이라는 이름을 지칭하며, 콜론 없이 isbn을 사용하면 이는 이 변수의 값 자체를 의미한다,
#   # 이 에제에서는 접근자 메소드 이름으로 isbn과 price를 사용하고 있다. 여기에 대웅하는 인스턴수 변수는 각각 @isbn과 @price이다.
#   attr_reader :isbn, :price
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
# end
#
# book = BookInStock.new("isbn1", 12.34)
# puts "ISBN = #{book.isbn}"
# puts "Price = #{book.price}"

 # #쓰기 가능한 속성
 # 객체 밖에서 속성을 설정해야 할 때도  있다.
 # C#이다 Java 같은 언어에서는 setter 함수를 사용할 것이다.

#java code
#  class JavaBookInStock {
#     private double _price;
#     public double getPrice() {
#       return _price;
#     }
#     public void setPrice(double newPrice) {
#       _price = newPrice;
#     }
#  }
# JavaBookInStock b = new JavaBookInStock(...);
# b.setPrice(calculate_discount(b.getPrice()));

# 루비에서는 객체의 속성에도 다른 변수와 마찬가지로 접근 가능하다. 접근 가능한 속성에 값을 대입하는 것도 매우 자연스러운 일이다.
# 루비에서는 메소드 이름 뒤에 = 기호를 사용해 대입 기능을 구현 할 수 있다. 이렇게 만들어진 메소드를 값을 대입하는데 사용할 수 있다.
# class BookInStock
#   attr_reader :isbn, :price
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
#
#   def price=(new_price)
#     @price = new_price
#   end
# end
# book = BookInStock.new("isbn1", 33.80)
# puts "ISBN = #{book.isbn}"
# puts "Price = #{book.price}"
# book.price = book.price * 0.75  #할인된 가격
# puts "New prcie #{book.price}"

# book.price = book.price * 0.75라는 대입문은 book객체의 price= 메소드를 호출하고 인자로 할인된 가격을 넘겨준다.
# 이름이 =로 끝나는 메소드를 정의하면 =앞의 메소드 이름을 대입문의 좌변에 사용할 수 있게된다.
# 루비는 이러한 대입 메소드를 만드는 간단한 표현을 제공한다. 값을 대입하는 메서드만 만드록 싶다면 attr_writer를 사용하면 된다.
# 일반적으로 인스턴스 변수의 값을 속서응로 읽는 것과 대입하는 것을 모두 필요로 한다. 루비는 이를 위한 메소드들을 한 번에 정의 해주는
# attr_accessor메소드를 제공한다.

# class BookInStock
#   attr_reader :isbn
#   attr_accessor :price
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
#
# end
# book = BookInStock.new("isbn1", 33.80)
# puts "ISBN = #{book.isbn}"
# puts "Price = #{book.price}"
# book.price = book.price * 0.75  #할인된 가격
# puts "New prcie #{book.price}"



#가상 속성
# 속성에 접근하는 메소드가 단지 객체의 인스턴스 변수를 읽거나 대입하는 간단한 메소드일 필요는 없다.
# 예를 들어 달러 단위의 부동소수점 표현이 아니라 센트 단위까지 좀 더 정확한 가격을 표기하고 싶을 수 있다.
# class BookInStock
#   attr_reader :isbn
#   attr_accessor :price
#   def initialize(isbn, price)
#     #인스턴스 변수는 @으로 시작한다.
#     @isbn = isbn
#     @price = Float(price)
#   end
#
#   def price_in_cents
#     # 부동소수점으로 된 가격으로 부터 센트를 유추해 내기 위해 100을 곱한 다음에 0.5를 더하고 정수로 변환했다.
#     # 이는 부동소수점이 항상 정확한 값을 내부적으로 가지고 있다는 보장이 없기 때문이다.
#     # 정수로 변환하기 전에 0.5를 더해주면 부동소수점이 반올림 되어 좀 더 실제 값에 가까운 정수 표현을 얻을 수 있게 된다.
#     # 바로 이 때문에 금율 계산할때는 Float보다 BigDecimal이 선호된다.
#     Integer(price * 100 + 0.5)
#   end
# end
# book = BookInStock.new("isbn1", 33.80)
# puts "ISBN = #{book.isbn}"
# puts "Price = #{book.price}"
# puts "Price in cents = #{book.price_in_cents}"


# 여기서 한 걸음 더 나아가 가상 속석에 대한 대입이 가능하도록 만들 수도 있다.
# 이는 가상 속성값을 인스턴스 변수에 매핑하는 방버으로 이루어진다.
class BookInStock
  attr_reader :isbn
  attr_accessor :price
  def initialize(isbn, price)
    #인스턴스 변수는 @으로 시작한다.
    @isbn = isbn
    @price = Float(price)
  end

  def price_in_cents
    Integer(price * 100 + 0.5)
  end
  def price_in_cents=(cents)
    @price = cents / 100.0
  end
end
book = BookInStock.new("isbn1", 33.80)
puts "Price = #{book.price}"
puts "Price in cents = #{book.price_in_cents}"
book.price_in_cents = 1234
puts "Price = #{book.price}"
puts "Price in cents = #{book.price_in_cents}"

# 여기서는 속성 메소드를 사용해서 가상 인스턴스 변수를 생성한다.
# 객체의 밖에서 price_in_cents는 다른 속성들과 마찬가지로 그저 객체의 속성으로 보인다.
# 하지만 내부적으로 이 속성은에 대응하는 인스턴스 변수는 존재하지 않는다.
# 버튼랜드 메이어는 이를 단일 접근 원칙이라는 말로 표현한 바있다.
# 이를 통해 인스턴스 변수와 계산된 값의 차이점을 숨겨서, 클래스 구현에서 나머지 세상을 보호할 수 있는 방법을 제공할 수 있다.
# 다시 말해 우리가 만든 클래스를 사용할 수백만 줄의 코드에 영향을 주지않고 내부구현을 바꿀 수 있게 된 것이다.

#속성, 인스턴스 변수, 메소드
# 클래스를 설계할 때는 내부적으로 어떤 상태를 가지고, 이 상태를 외부에 어떤 모습으로 노출할지 결정해야한다.
# 여기서 내부 상태는 인스턴스 변수에 저장한ㄷ. 외부에 보이는 상태는 속성이라고 부르는 메소드를 통해야만 한다.
# 그밖에 클래스가 할 수 있는 모든 행동은 일반 메소드를 통해야만 한다.
# 이런 구분법이 아주 주용한 것은 아니지만 , 그래도 객체의 외부 상태를 속성이라고 부른다면 클래스를 사용하는 사람이
# 우리가 만든 클래스를 어떻게 봐야 하는지에 대한 힌트를 줄 수 있을 것이다.

#다른클래스와 사용하기
# 객체 지향 설계에서는 외부의 대상을 파악하고 이를 코드를 통해 클래스로 만든다.
# 하지만 설계상에서 클래스의 대상이 되는 또 다른 대상이 있다. 이는 외부가 아닌 내부 코드 자체에서 대응하는 클래스다.

# 예를 들어 우리가 만들고자 하는 프로그램에서는 CSV 데이터를 읽어 들여 통계를 내고 요약해야 한다.
# class CsvReader
#   def initialize
#     #...
#   end
#
#   def read_in_csv_data(csv_file_name)
#     #...
#   end
#
#   def total_value_in_stock
#     #...
#   end
#
#   def number_of_each_isbn
#     #...
#   end
# end
# # 이 클래스는 다음과 같이 호출할 수 있다.
# reader = CsvReader.new
# reader.read_in_csv_data("file1.csv")
# reader.read_in_csv_data("file2.csv")
#           ~중략~
# puts "Total value in stock = #{reader.total_value_in_stock}"
# 다수의 CSV 파일을 읽어 들이기 위헤 reader객체에 넘겨 읽어 들인 값들을 축적할 필요가 있다.
# CSV 파일을 어떻게 분석할지 하는 문제가 남았다. 다행히 루비에서는 훌륭한 CSV 라이브러리가 있다.
