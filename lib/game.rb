class Game
  attr_accessor :players, :board, :turn

  def initialize
    puts "Bienvenue dans notre jeu de Morpion !"
    puts "Premier joueur, donne nous ton nom !"
    print "> "
    @players = []
    @players << Player.new(gets.chomp, "X")
    puts "Deuxième joueur, donne nous ton nom !"
    print "> "
    @players << Player.new(gets.chomp, "O")
    @board = Board.new
    #begginner = who_starts?.name
    #puts "Le joeur qui débutera la partie est #{begginner}"
    @turn = 0
  end
=begin
  #def who_starts?
  #  starter = rand(1..2)
  #  return @player1 if starter == 1
  #  return @player2 if starter == 2
  #end

  #def gaming
  #  @turn += 1
  #  player1.play
  #  player2.play
  #end
=end
  def play
    @turn += 1
    current_player = @players[(@turn - 1) % 2]
    choice = ""
    authorized_values = @board.get_possible_choice
    while !choice.match? /#{authorized_values}/
      puts current_player.name + ", choisis ta case !"
      print "> "
      choice = gets.chomp.upcase
      case choice
        when "A1" then @board.board_cases[0][0].value = current_player.symbol if @board.board_cases[0][0].value == " "
        when "B1" then @board.board_cases[0][1].value = current_player.symbol if @board.board_cases[0][1].value == " "
        when "C1" then @board.board_cases[0][2].value = current_player.symbol if @board.board_cases[0][2].value == " "
        when "A2" then @board.board_cases[1][0].value = current_player.symbol if @board.board_cases[1][0].value == " "
        when "B2" then @board.board_cases[1][1].value = current_player.symbol if @board.board_cases[1][1].value == " "
        when "C2" then @board.board_cases[1][2].value = current_player.symbol if @board.board_cases[1][2].value == " "
        when "A3" then @board.board_cases[2][0].value = current_player.symbol if @board.board_cases[2][0].value == " "
        when "B3" then @board.board_cases[2][1].value = current_player.symbol if @board.board_cases[2][1].value == " "
        when "C3" then @board.board_cases[2][2].value = current_player.symbol if @board.board_cases[2][2].value == " "
      end
    end
  end

  def is_still_ongoing?
    return @board.empty_cases > 0 && !@board.winning_combination
  end

  def end
    if @board.winning_combination
      puts @players[(@turn - 1) % 2].name + " a gagné ! CHAMPIOOOOOON"
    else
      puts "Match nul ! Réessaye encore ! Appuie sur entrée pour rejouer"
    end
  end


      
end




