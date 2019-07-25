class Game
  attr_accessor :players, :rounds

  def initialize
    Title.new
    system "clear"
    puts "Premier joueur (X), donne nous ton nom !"
    print "> "
    @players = [] #array de joueurs
    @players << Player.new(gets.chomp, "X".red) #premier joueur, dont le nom est demandé et le symbole est imposé et coloré
    puts "Deuxième joueur (O), donne nous ton nom !"
    print "> "
    @players << Player.new(gets.chomp, "O".blue)
    @rounds = 0
  end

  def start
    cmd = ""
    while cmd != "q"
      @rounds += 1 #compteur de tours
      my_round = Round.new(@players, @rounds)
      while my_round.is_still_ongoing? #boucle qui permet de vérifier que le tour n'est pas fini pour continuer à jouer
        my_round.play
      end
      my_round.end
      cmd = gets.chomp.downcase #sort du jeu si l'utilisateur tappe q pour quitter, sinon on part pour un nouveau tour !
    end
  end
end




