class Board
  attr_accessor :board_cases, :cursor

  def initialize
    @board_cases = []
    9.times {@board_cases << BoardCase.new} #remplie le array board_cases avec 9 nouveaux BoardCase
    @cursor = -1
  end

  def get_possible_choice(possible_choices) #methode qui permet de modifier la liste des authorized_values utilisé dans round
    choice_possible = []
    0.upto(8) do |index|
      choice_possible << possible_choices[index] if board_cases[index].is_empty? #on retourne les index des choix possibles (lorsque les cases sont vides)
    end
    return choice_possible.join("|") #on les joign avec un | pour qu'ils soient au format Regex (/A1|A2|A3|.../)
  end

  def empty_cases #ici on compte le nombre de case vide
    empty_cases = 0
    @board_cases.each do |index|
      if index.is_empty?
        empty_cases += 1 
      end
    end
    return empty_cases
  end

  def winning_combination #ici on vérifie s'il y a des combinaisons gagnantes, si c'est le cas on retourne true
    if !@board_cases[0].is_empty? && @board_cases[0].value == @board_cases[1].value && @board_cases[0].value == @board_cases[2].value
      return true
    elsif !@board_cases[3].is_empty? && @board_cases[3].value == @board_cases[4].value && @board_cases[3].value == @board_cases[5].value
      return true
    elsif !@board_cases[6].is_empty? && @board_cases[6].value == @board_cases[7].value && @board_cases[6].value == @board_cases[8].value
      return true
    elsif !@board_cases[0].is_empty? && @board_cases[0].value == @board_cases[3].value && @board_cases[0].value == @board_cases[6].value
      return true
    elsif !@board_cases[1].is_empty? && @board_cases[1].value == @board_cases[4].value && @board_cases[1].value == @board_cases[7].value
      return true
    elsif !@board_cases[2].is_empty? && @board_cases[2].value == @board_cases[5].value && @board_cases[2].value == @board_cases[8].value
      return true
    elsif !@board_cases[0].is_empty? && @board_cases[0].value == @board_cases[4].value && @board_cases[0].value == @board_cases[8].value
      return true
    elsif !@board_cases[2].is_empty? && @board_cases[2].value == @board_cases[4].value && @board_cases[2].value == @board_cases[6].value
      return true
    else
      return false
    end
  end
  #ce qui suit permet de borner le curseur, qui peut désormais se balader que dans la board 
  def cursor_up
    @cursor -= 3 if @cursor >= 3
  end

  def cursor_down
    @cursor += 3 if @cursor <= 5
  end

  def cursor_left
    @cursor -= 1 if @cursor % 3 != 0
  end

  def cursor_right
    @cursor += 1 if @cursor % 3 != 2
  end
end
  