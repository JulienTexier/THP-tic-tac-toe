class Board
  attr_accessor :board_cases

  def initialize
    @board_cases = [[BoardCase.new, BoardCase.new, BoardCase.new],[BoardCase.new, BoardCase.new, BoardCase.new], [BoardCase.new, BoardCase.new, BoardCase.new]] 
  end

  def get_possible_choice
    choice_possible = []
      if board_cases[0][0].value == " " 
        choice_possible << "A1"
      end
      if board_cases[0][1].value == " " 
        choice_possible << "B1"
      end
      if board_cases[0][2].value == " " 
        choice_possible << "C1"
      end
      if board_cases[1][0].value == " " 
        choice_possible << "A2"
      end
      if board_cases[1][1].value == " " 
        choice_possible << "B2"
      end
      if board_cases[1][2].value == " " 
        choice_possible << "C2"
      end
      if board_cases[2][0].value == " " 
        choice_possible << "A3"
      end
      if board_cases[2][1].value == " " 
        choice_possible << "B3"
      end
      if board_cases[2][2].value == " " 
        choice_possible << "C3"
      end
      return choice_possible.join("|")
  end

  def empty_cases
    empty_cases = 0
    @board_cases.each do |index|
      index.each do |sub_index|
        if sub_index.is_empty?
          empty_cases += 1 
        end
      end
    end
    return empty_cases
  end

  def winning_combination
    if @board_cases[0][0].value != " " && @board_cases[0][0].value == @board_cases[0][1].value && @board_cases[0][1].value == @board_cases[0][2].value
      return true
    elsif @board_cases[1][0].value != " " && @board_cases[1][0].value == @board_cases[1][1].value && @board_cases[1][0].value == @board_cases[1][2].value
      return true
    elsif @board_cases[2][0].value != " " && @board_cases[2][0].value == @board_cases[2][1].value && @board_cases[2][0].value == @board_cases[2][2].value
      return true
    elsif @board_cases[0][0].value != " " && @board_cases[0][0].value == @board_cases[1][0].value && @board_cases[0][0].value == @board_cases[2][0].value
      return true
    elsif @board_cases[0][1].value != " " && @board_cases[0][1].value == @board_cases[1][1].value && @board_cases[0][1].value == @board_cases[2][1].value
      return true
    elsif @board_cases[0][2].value != " " && @board_cases[0][2].value == @board_cases[1][2].value && @board_cases[0][2].value == @board_cases[2][2].value
      return true
    elsif @board_cases[0][0].value != " " && @board_cases[0][0].value == @board_cases[1][1].value && @board_cases[0][0].value == @board_cases[2][2].value
      return true
    elsif @board_cases[0][2].value != " " && @board_cases[0][2].value == @board_cases[1][1].value && @board_cases[0][2].value == @board_cases[2][0].value
      return true
    else
      return false
    end
  end

end
  