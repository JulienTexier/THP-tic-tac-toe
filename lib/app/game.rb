class Game
  attr_accessor :players, :board, :turn, :random_bool

  def initialize
    system "clear"
    puts "Premier joueur (X), donne nous ton nom !"
    print "> "
    @players = []
    @players << Player.new(gets.chomp, "X".red)
    puts "Deuxième joueur (O), donne nous ton nom !"
    print "> "
    @players << Player.new(gets.chomp, "O".blue)
    @board = Board.new
    @turn = 0
    @random_bool = rand(0..1)
    puts "Le tirage au sort a désigné #{@players[1 - @random_bool].name} comme le joueur qui débutera la partie !"
    puts "Appuie sur entrée pour démarrer !"
    gets
  end

  def play
    @turn += 1
    current_player = @players[(@turn - @random_bool) % 2]
    choice = ""
    possible_choices = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3"]
    authorized_values = @board.get_possible_choice(possible_choices)
    while !choice.match? /#{authorized_values}/
      puts current_player.name + ", choisis ta case !"
     # print "> "
      #choice = gets.chomp.upcase
      choice = select_case(possible_choices, current_player)
      if possible_choices.index(choice) != nil
        case_nr = possible_choices.index(choice)
        @board.board_cases[case_nr].value = current_player.symbol if @board.board_cases[case_nr].is_empty?
      end
    end
  end

  def select_case(possible_choices, current_player)
    key = ""
    @board.cursor = 4
    while key != "\r" do
      Show.new(@board, (@turn - @random_bool)%2)
      puts current_player.name + " , choisis ta case !"
      key = STDIN.getch
      case key.downcase
      when "z"
        @board.cursor_up
      when "q"
        @board.cursor_left
      when "s"
        @board.cursor_down
      when "d"
        @board.cursor_right
      end
    end
    choice = possible_choices[@board.cursor]
    @board.cursor = -1
    return choice
  end

  def is_still_ongoing?
    return @board.empty_cases > 0 && !@board.winning_combination
  end

  def end
    if @board.winning_combination
      puts @players[(@turn - @random_bool) % 2].name + " a gagné ! CHAMPIOOOOOON !!"
    else
      puts "Match nul ! Réessaye encore !"
    end
    puts "Appuie sur entrée pour rejouer ou tape 'q' pour quitter"
  end


      
end




