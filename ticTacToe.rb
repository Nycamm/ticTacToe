#Tic tac toe, I need:
#Initialize game (blank game board, instructions, ask for input)
#update game board and check for winner
 #if winner, ask to restart game
 #if no winner, ask next player to make their move and repeat

class Game
  def initialize
    puts "Let's play Tic Tac Toe."

    @gameboard = Gameboard.new
    @player = :X

    play
  end

  def play
    puts "\nPlayer #{@player.to_s}, please enter the number of the square you want to take."

    @position = gets.chomp
    @gameboard.update(@player, @position.to_i)

    if @gameboard.winner?(@player)
      puts "\n#{@player} wins!"
      puts "Would you like to play again? (y/n)"

      gets.chomp.downcase == "y" ? Game.new : return
    elsif @player == :X
      @player = :O

      play
    else
      @player = :X

      play
    end
  end
end

class Gameboard
  def initialize
    @all_positions = Array(1..9)

    display

    @all_positions = Array.new(9, " ")
    @moves = {X: [], O: []}
  end

  def update(player, position)
    player = player.upcase.to_sym

    if @all_positions[position -1] == " "
      @moves[player].push(position)
      @moves[player].each{ |pos| @all_positions[pos.to_i   - 1] = player.to_s}
    else
      puts "You can't play there, please choose again"
      new_position = gets.chomp.to_i
      update(player, new_position)
    end

    display
  end

  def winner?(player)
    @winners = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    win = false
    @winners.each { |w| win = true if (w - @moves[player.upcase.to_sym]).empty?}
    return win
  end

  private

  def display
    puts "\n#{@all_positions[6]} | #{@all_positions[7]} | #{@all_positions[8]}"
    puts "- | - | -"
    puts "#{@all_positions[3]} | #{@all_positions[4]} | #{@all_positions[5]}"
    puts "- | - | -"
    puts "#{@all_positions[0]} | #{@all_positions[1]} | #{@all_positions[2]}"
  end
end

Game.new
