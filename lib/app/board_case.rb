class BoardCase
  attr_accessor :value

  def initialize
    @value = " "
  end

  def is_empty?
    return @value == " "
  end

end