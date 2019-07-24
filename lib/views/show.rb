class Show
  
  def initialize(board)
    puts "+---+---+---+"
    puts "| #{board.board_cases[0][0].value} | #{board.board_cases[0][1].value} | #{board.board_cases[0][2].value} |"
    puts "+---+---+---+"
    puts "| #{board.board_cases[1][0].value} | #{board.board_cases[1][1].value} | #{board.board_cases[1][2].value} |"
    puts "+---+---+---+"
    puts "| #{board.board_cases[2][0].value} | #{board.board_cases[2][1].value} | #{board.board_cases[2][2].value} |"
    puts "+---+---+---+"
  end
end