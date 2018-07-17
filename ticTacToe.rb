#Tic tac toe, I need:
#Initialize game (blank game board, instructions, ask for input)
#update game board and check for winner
 #if winner, ask to restart game
 #if no winner, ask next player to make their move and repeat

class Gameboard
  def initialize
    @allPositions = Array(1..9)

    display

    @allPositions = Array.new(9, " ")
    @moves = {X: [], O: []}
  end

  def update(player, position)
    player = player.upcase.to_sym
    @moves[player].push(position)
    @moves[player].each{ |pos| @allPositions[pos - 1] = player.to_s}

    display
  end

  private

  def display
    puts "#{@allPositions[0]} | #{@allPositions[1]} | #{@allPositions[2]}"
    puts "- | - | -"
    puts "#{@allPositions[3]} | #{@allPositions[4]} | #{@allPositions[5]}"
    puts "- | - | -"
    puts "#{@allPositions[6]} | #{@allPositions[7]} | #{@allPositions[8]}"
  end
end

class Player
  def initialize
  end

end

test = Gameboard.new
test
puts " "
test.update("X", 5)
test
puts ""
test.update("o", 1)
test
puts ""
test.update("x", 6)
test
