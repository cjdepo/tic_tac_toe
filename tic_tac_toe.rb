
class Player
  attr_reader :player_id, :type, :board

  @@player_count = 0

  def initialize(board)
    @@player_count += 1
    @player_id = @@player_count
    @type = @player_id == 1 ? 'x' : 'o'
    @board = board
  end

  def play(position)
    @board.set_space(self.type, position - 1)
  end
end

class Game
  attr_reader :spaces

  def initialize
    @spaces = [' ', ' ', ' ',
               ' ', ' ', ' ',
               ' ', ' ', ' ']
  end

  def self.new_game
    game = Game.new
    player1 = Player.new(game)
    player2 = Player.new(game)
    while true
      position = game.player_turn(1).to_i
      player1.play(position)
      game.display
      if game.win?
        puts "Player 1 wins!"
        break
      end
      if game.end?
        puts "Tie!"
        break
      end

      position = game.player_turn(2).to_i
      player2.play(position)
      game.display
      if game.win?
        puts "Player 2 wins!"
        break
      end
      if game.end?
        puts "Tie!"
        break
      end
    end
  end
  
  def player_turn(player_id)
    puts "Player #{player_id} your turn.  Enter a number
    \ncorresponding to the spaces as follows:
    \n     1   2   3
    \n     4   5   6
    \n     7   8   9
    \nEnter your number:"
    while true
      number = gets.to_i
      case
      when ![1, 2, 3, 4, 5, 6, 7, 8, 9].include?(number)
        self.display
        puts "You must enter a number (1 through 9):"
        next
      when @spaces[number - 1] != " "
        self.display
        puts "That space is already taken!"
        next
      end 
      if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(number) && @spaces[number - 1] == " "
        return number
        break
      end
    end
  end

  def clear
    @spaces = [' ', ' ', ' ',
               ' ', ' ', ' ',
               ' ', ' ', ' ']
  end

  def set_space(type, position)
    @spaces[position] = type
  end

  def display
    puts "\n\n\n\n\n\n"
    p spaces[0..2]
    p spaces[3..5]
    p spaces[6..8]
    puts "\n\n\n\n\n"
  end

  def end?
    !@spaces.include?(' ')
  end

  def win?
    x_indexes = spaces.each_with_index.map { |type, index| type == "x" ? index : nil}.compact
    o_indexes = spaces.each_with_index.map { |type, index| type == "o" ? index : nil}.compact
    case
    when ([0, 1, 2] - x_indexes).empty?,
         ([3, 4, 5] - x_indexes).empty?,
         ([6, 7, 8] - x_indexes).empty?,
         ([0, 3, 6] - x_indexes).empty?,
         ([1, 4, 7] - x_indexes).empty?,
         ([2, 5, 8] - x_indexes).empty?,
         ([0, 4, 8] - x_indexes).empty?,
         ([2, 4, 6] - x_indexes).empty?,
         ([0, 1, 2] - o_indexes).empty?,
         ([3, 4, 5] - o_indexes).empty?,
         ([6, 7, 8] - o_indexes).empty?,
         ([0, 3, 6] - o_indexes).empty?,
         ([1, 4, 7] - o_indexes).empty?,
         ([2, 5, 8] - o_indexes).empty?,
         ([0, 4, 8] - o_indexes).empty?,
         ([2, 4, 6] - o_indexes).empty?
      return true
    else
      return false
    end
  end
end

Game.new_game