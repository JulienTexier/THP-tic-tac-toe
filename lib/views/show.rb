class Show
  
  def initialize(board, current_player_number = 0, players, current_round)
    cursor_array_L = [" "] * 9 #permet l'affichage du curseur sur les 9 cases
    cursor_array_R = [" "] * 9 #permet l'affichage du curseur sur les 9 cases
    if board.cursor.between?(0, 8) #boucle qui permet d'afficher le curseur uniquement dans la board
      if current_player_number == 0 #on colorise en rouge pour player[0]
      cursor_array_L[board.cursor] = ">".red
      cursor_array_R[board.cursor] = "<".red
      else #on colorise en bleu pour player[1]
        cursor_array_L[board.cursor] = ">".blue
        cursor_array_R[board.cursor] = "<".blue
      end
    end
    system "clear"
    puts "Le joueur #{players[0].name} (#{players[0].symbol.red}) a #{players[0].victories} victoires" 
    puts "Le joueur #{players[1].name} (#{players[1].symbol.blue}) a #{players[1].victories} victoires"
    puts
    puts "Ceci est la partie n°#{current_round}." #annonce du tour joué
    puts
    puts "Pour déplacer le curseur, appuie sur Z ( ↑ ), Q ( ← ), S ( ↓ ) et D ( → ) puis appuie sur entrée pour valider ton choix !"
    puts
    puts "    A   B   C"
    puts "  +---+---+---+"
    # puts "1  |#{cursor_array_L[0]}#{board.board_cases[0].value}#{cursor_array_R[0]}|#{cursor_array_L[1]}#{board.board_cases[1].value}#{cursor_array_R[1]}|#{cursor_array_L[2]}#{board.board_cases[2].value}#{cursor_array_R[2]}|"
    # puts "   +---+---+---+"
    # puts "2  |#{cursor_array_L[3]}#{board.board_cases[3].value}#{cursor_array_R[3]}|#{cursor_array_L[4]}#{board.board_cases[4].value}#{cursor_array_R[4]}|#{cursor_array_L[5]}#{board.board_cases[5].value}#{cursor_array_R[5]}|"
    # puts "   +---+---+---+"
    # puts "3  |#{cursor_array_L[6]}#{board.board_cases[6].value}#{cursor_array_R[6]}|#{cursor_array_L[7]}#{board.board_cases[7].value}#{cursor_array_R[7]}|#{cursor_array_L[8]}#{board.board_cases[8].value}#{cursor_array_R[8]}|"
    # puts "   +---+---+---+"
    0.upto(2) do |index_row| #création de la board visuelle de manière plus propre que celle ci-dessus en commentaire
      print "#{index_row + 1} |"
      0.upto(2) do |index_col|
        i = index_row*3 + index_col
        print "#{cursor_array_L[i]}#{board.board_cases[i].value}#{cursor_array_R[i]}|"
      end
      puts "\n  +---+---+---+"
    end
    puts
  end
end