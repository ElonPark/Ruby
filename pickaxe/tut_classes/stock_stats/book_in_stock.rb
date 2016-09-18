class BookInStock
  attr_reader :isbn, :price
  
  def initialize(isbn, price)
    #인스턴스 변수는 @으로 시작한다.
    @isbn = isbn
    @price = Float(price)
  end
end
