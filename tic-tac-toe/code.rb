require 'pry-byebug'

class Player
  $playerMove = []
  
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @test = []
  end

  attr_reader :name, :symbol

  def playerMove()
    @test
  end

  def playerMovePop 
     a = $playerMove
     return a.pop
  end

  def move
    state = true
    while state
      puts 'enter the row number'
      row = gets.chomp
      puts 'enter the column number'
      column = gets.chomp
      if row and column =~ /^-?[1-3]+$/
        if (row.to_i <= 3 and row.to_i >= 1) and (column.to_i >= 1 and column.to_i <= 3)
          $playerMove.push([row.to_i - 1, column.to_i - 1]) 
          @test.push([row.to_i - 1, column.to_i - 1]) 
          p @test
          state = false
        else
          puts "enter a number between 1 and 3"
        end
      end
    end
  end
end

class GameBoard
  player1 = Player.new('player1', 'x')
  player2 = Player.new('player2', 'o')

  $GameOn = true
  $roundOn = true
  $gameBoard = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
  
  

  def self.gridFill (playerPosition , playerSymbol)
    row = playerPosition[0]
    p playerSymbol
    column = playerPosition[1]
    if $gameBoard[row][column] == " " 
      $gameBoard[row][column] = playerSymbol
      $roundOn = false; 
    else
      puts"\nalready full plz enter you input some were else"
      $roundOn = true;
    end

    for i in 0..2
      print "|"
      for x in 0..2
        if $gameBoard[i][x] == 'x' || 'o'
          print "#{$gameBoard[i][x]}|"
        else
          print " |"
        end
      end
      print"\n"
      puts"--------"
    end

  end

  $win = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],

    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],

    [[0, 0], [1, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 1]]
  ]

  def self.result(playerArr , name)
    $win.each do |index|
      if (index & playerArr).length == 3
        puts "Congratulations #{name}"
        $GameOn = false
      end
    end
  end

  loop do
    rounds = 0
    loop do
      puts 'player 1 turn'
      player1.move
      gridFill(player1.playerMovePop, player1.symbol)
      break if $roundOn == false
    end
    result(player1.playerMove , player1.name)

    if $GameOn
    loop do
      puts 'player 2 turn'
      player2.move
      gridFill(player2.playerMovePop, player2.symbol)
      break if $roundOn == false
    end
    result(player2.playerMove , player2.name)
  end

    round =+ 1 
    binding.pry
    
    if rounds == 9
      puts 'the game is tie'
    end
  break if rounds == 9 || $GameOn == false
  end

end

GameBoard.new
