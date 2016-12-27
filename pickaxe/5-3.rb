#믹스인
# 모듈에서 믹스인 기능을 이용하면 많은 경우에서 다중 상속을 할 필요가 사라진다.
# 모듈은 인스턴스를 가질 수 없다. 클래스가 아니기 때문이다. 하지만 클래스 선언에 모듈을 포함할 수 있다.
# 모듈을 포함하면 이 모듈의 모든 인스턴스 메소드는 클래스의 인스턴스 메소드처럼 동작한다.

# 즉, 이 메소드가 클래스에 녹아서 섞여 버린(mixed in) 것 이다.
# 믹스인된 모듈은 실제로는 일종의 부모 클래스처럼 동작한다.

module Debug
  def who_am_i?
    "#{self.class.name} (id: #{self.object_id}): #{self.name}"
  end
end

class Phonograph
  include Debug
  attr_reader :name
  def initialize(name)
    @name = name
  end
  #...
end

class EightTrack
  include Debug
  attr_reader :name
  def initialize(name)
    @name = name
  end
  #...
end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")

p ph.who_am_i?
p et.who_am_i?
