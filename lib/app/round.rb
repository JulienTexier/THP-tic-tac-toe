class Round
  attr_accessor :players, :board, :turn, :random_bool, :current_round

  def initialize(players, round_number)
    system "clear" #permet de clearer le terminal pour un affichage plus propre
    @current_round = round_number
    @players = players
    @board = Board.new #création du board
    @turn = 0
    @random_bool = rand(0..1) #on fait une fonction aléatoire pour désigner le joueur qui joue en premier
    puts "Le tirage au sort a désigné #{@players[1 - @random_bool].name} comme le joueur qui débutera la partie !" #on annonce le joeur désigné
    puts "Appuie sur entrée pour démarrer !"
    gets
  end

  def play
    @turn += 1
    current_player = @players[(@turn - @random_bool) % 2] #turn représente le numéro du tour, faire turn - random_bool (égale à 1 ou 0) modulo 2 permet d'avoir soit 0, soit 1, ce qui nous permet de choisir le joueur[0] ou joueur [1]
    choice = ""
    possible_choices = ["A1", "B1", "C1", "A2", "B2", "C2", "A3", "B3", "C3"] #ceci est la liste des coordonnées des cases qui sera utile ensuite
    authorized_values = @board.get_possible_choice(possible_choices)
    while !choice.match? /#{authorized_values}/ #boucle qui permet au joeur qui s'est trompé de case de rejouer directement
      choice = select_case(possible_choices, current_player)
      case_nr = possible_choices.index(choice)
      @board.board_cases[case_nr].value = current_player.symbol if @board.board_cases[case_nr].is_empty? #condition qui empêche l'utilisateur de sélectionner une case déjà remplie
    end
  end

  def select_case(possible_choices, current_player)
    key = ""
    @board.cursor = 4 #on met de base le curseur sur la case du milieu
    while key != "\r" do
      Show.new(@board, (@turn - @random_bool)%2, @players, @current_round)
      puts current_player.name + " , choisis ta case !"
      key = STDIN.getch 
      case key.downcase #permet de naviguer dans les cases
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
    @board.cursor = -1 #permet d'effacer le curseur à l'affichage de la grille après le choix
    return choice
  end

  def is_still_ongoing?
    return @board.empty_cases > 0 && !@board.winning_combination #retourne un boolean disant si la partie est finie ou non
  end

  def end
    Show.new(@board, @players, @current_round)
    if @board.winning_combination
      puts @players[(@turn - @random_bool) % 2].name + " a gagné ! CHAMPIOOOOOON !!"
      @players[(@turn - @random_bool) % 2].victories += 1 #compteur de victoire
    else
      puts "Match nul ! Réessaye encore !"
    end
    puts "Appuie sur entrée pour rejouer ou tape 'q' pour quitter"
  end      
end