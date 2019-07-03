class Board
  private
  attr_accessor :board
  public
  def initialize()
    @board = Array.new(3){Array.new(3)}
    k = 0
    for i in 0..2
      for j in 0..2
        k += 1
        @board[i][j] = k
      end
    end
  end
  def display
    puts "============"
    @board.each do |x|
      x.each do |y|
        print " " + y.to_s + " " + "|"

      end
      puts "\n============"
    end
  end
  def update(move,mark)
    case move
    when 1,2,3
      if @board[0][move - 1].is_a? Integer
        @board[0][move - 1] = mark
      else
        puts "ERROR! Choose Another Position "
        false
      end
    when 4,5,6
      if @board[1][move - 4].is_a? Integer
        (@board[1][move - 4] = mark)
      else
        puts "ERROR! Choose Another Position "
        false
      end
    when 7,8,9
      if @board[2][move - 7].is_a? Integer
        @board[2][move - 7] = mark
      else
        puts "ERROR! Choose Another Position "
        false
      end
    else
      puts "ERROR! ILLEGAL MOVE!"
    end
  end
  def isWinner
    check = false
    for i in 0..2
      if @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2]
        check = true
      elsif @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
        check = true
      elsif @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
        check = true
      elsif @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
        check = true
      end
    end
    check
  end
end

class Player
  private
  attr_accessor :name, :mark
  public
  def initialize(name,mark)
    @name = name
    @mark = mark
  end
  def playerMove(move,board)
    board.update(move,mark)
  end
  def getName
    @name
  end
  def getMark
    @mark
  end
end

def game
  board = Board.new
  players = Array.new
  puts "- - - - - T I C - T A C - T O E - - - - -"
  puts "\nChoose Player 1 Name ?"
  name = gets.chomp
  players[0] = Player.new(name,"X")
  puts "\nChoose Player 2 Name ?"
  name = gets.chomp
  players[1] = Player.new(name,"O")
  i = 0
  turn = i % 2
  while !board.isWinner
    turn = i % 2
    board.display
    puts "\nPlayer #{players[turn].getName}'s [#{players[turn].getMark}] Choose [1..9]"
    move = gets.chomp
    i+=1 if players[turn].playerMove(move.to_i,board)
  end
  board.display
  puts "Player #{players[turn].getName} Wins!"
end
game()
