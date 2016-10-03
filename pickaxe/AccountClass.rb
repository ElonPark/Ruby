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

class Transction

	def initialize(account_a, account_b)
		@account_a = account_a
		@account_b = account_b
	end

	private

	def debit(account, amount)
		account.balance -= amount
	end
	def credit(account, amount)
		account.balance += amount
	end

	public

	#...

	def transfer(amount)
		debit(@account_a, amount)
		credit(@account_b, amount)
	end
	#...
end

savings = Account.new(100)
checking = Account.new(200)

trans = Transction.new(checking, savings)
trans.transfer(50)

# protected 접근은 객체가 같은 클래스에서 생성된 다른 객체의 상태에  접근할 필요가 있을 때 사용한다. 
# 예를 들어  각각의 Account객체의 결산 잔애를 비교 하고 싶은데, 잔액 자체는 외부에 보여주고 싶지 않을 경우를 보자
 class Account2
 	attr_reader :cleared_balance # 접근자 메소드를 'cleared_balance'를 만든다.
 	protected :cleared_balance # 접근자 메소드를 protected 메소드로 설정한다.

 	def greater_balance_than?(other)
 		@cleared_balance > other.cleared_balance
 	end
 end

 # cleared_balance는 protected이므로 Account 객체에서만 접근이 가능하다.

 