class Show
  
  def initialize(board, current_player_number = 0)
    cursor_array_L = [" "] * 9
    cursor_array_R = [" "] * 9
    if board.cursor.between?(0, 8)
      if current_player_number == 0
      cursor_array_L[board.cursor] = ">".red
      cursor_array_R[board.cursor] = "<".red
      else
        cursor_array_L[board.cursor] = ">".blue
        cursor_array_R[board.cursor] = "<".blue
      end
    end
    system "clear"
    puts "Pour déplacer le curseur, appuie sur Z, Q, S ou D, puis appuie sur entrée pour valider ton choix !"
    puts
    puts "  +---+---+---+"
    puts "  |#{cursor_array_L[0]}#{board.board_cases[0].value}#{cursor_array_R[0]}|#{cursor_array_L[1]}#{board.board_cases[1].value}#{cursor_array_R[1]}|#{cursor_array_L[2]}#{board.board_cases[2].value}#{cursor_array_R[2]}|"
    puts "  +---+---+---+"
    puts "  |#{cursor_array_L[3]}#{board.board_cases[3].value}#{cursor_array_R[3]}|#{cursor_array_L[4]}#{board.board_cases[4].value}#{cursor_array_R[4]}|#{cursor_array_L[5]}#{board.board_cases[5].value}#{cursor_array_R[5]}|"
    puts "  +---+---+---+"
    puts "  |#{cursor_array_L[6]}#{board.board_cases[6].value}#{cursor_array_R[6]}|#{cursor_array_L[7]}#{board.board_cases[7].value}#{cursor_array_R[7]}|#{cursor_array_L[8]}#{board.board_cases[8].value}#{cursor_array_R[8]}|"
    puts "  +---+---+---+"
    puts
  end
end