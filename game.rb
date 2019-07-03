require './board.rb'
require './player.rb'

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
