#예제
# 모든 대변이 대응하는 차변을 가지는 잘 연결되는 회계 시스템을 모델링하고 있다고 해보자.
# 우리는 누구도 이 규칙을 위반하는 것을 원치 않기 때문에, 예금 대변과 차변을 다루는 메소드를 private으로 만들고,
# 외부 인터페이스는 트랙잭션 방식으로 정의하고자 한다.

class Account
  attr_accessor :balance
  def initialize(balance)
    @balance = balance
  end
end
