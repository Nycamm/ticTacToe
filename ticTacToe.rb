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
    @gameboard.update(@player, @position)
    if @gameboard.winner(@player)
      puts "#{@player} wins!"
      return
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
    @moves[player].push(position)
    @moves[player].each{ |pos| @all_positions[pos.to_i   - 1] = player.to_s}

    display
  end

  def winner(player)
  end

  private

  def display
    puts "\n#{@all_positions[0]} | #{@all_positions[1]} | #{@all_positions[2]}"
    puts "- | - | -"
    puts "#{@all_positions[3]} | #{@all_positions[4]} | #{@all_positions[5]}"
    puts "- | - | -"
    puts "#{@all_positions[6]} | #{@all_positions[7]} | #{@all_positions[8]}"
  end
end

Game.new
