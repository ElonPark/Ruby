# CsvReader 클래스는 두 개의 외부 라이브러리에 의존한다.
# 첫번째는 CSV 라이브러리이고 두 번째는 BookInStock 클래스를 포함하는 book_in_stock.rb파일이다.
# 루비는 외부 파일을 읽어 들이기 위한 헬퍼 메소드를 제공한다.
# 이 파일에서는 require를 사용해서 루비의 CSV 라이브러리를 읽어 들이고, require_relative를 사용해서
# book_in_stock.rb를 읽어 들인다.(require_relative를 사용하는 것은 로드하려는 파일의 위치가 로드하는 파일을 기준으로
# 상대 위치에 있기 때문이다. 여기서 두 파일은 모두 같은 위치에 있다.)

require 'csv'
require_relative 'book_in_stock'

class CsvReader
  def initialize
    @books_in_stock = []
  end

  def read_in_csv_data(csv_file_name)
    # 주어진 CSV 파일에 헤더 라인이 있다고 가정하고 나머지 라인을 반복적으로 읽어 들여 이름으로 값을 뽑아 낸다.
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"], row["Price"])
    end
  end

  def total_value_in_stock #뒤에서 inject를 통해 어떻게 합계를 구하는지 살펴본다.
    sum = 0.0
    @books_in_stock.each { |book| sum += book.price }
    sum
  end

  def number_of_each_isbn
     #...
  end

end
