class BoardCase
  attr_accessor :value

  def initialize
    @value = " " #on initialise les valeurs dans les cases à rien 
  end

  def is_empty?
    return @value == " " #retourne true pour dire qu'une case est vide
  end

end