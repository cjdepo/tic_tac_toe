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

  def clear
    @spaces = [' ', ' ', ' ',
               ' ', ' ', ' ',
               ' ', ' ', ' ']
  end

  def set_space(type, position)
    @spaces[position] = type
  end

  def display
    p spaces[0..2]
    p spaces[3..5]
    p spaces[6..8]
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
         ([2, 4, 6] - x_indexes).empty?
      puts 'x wins'
    when ([0, 1, 2] - o_indexes).empty?,
         ([3, 4, 5] - o_indexes).empty?,
         ([6, 7, 8] - o_indexes).empty?,
         ([0, 3, 6] - o_indexes).empty?,
         ([1, 4, 7] - o_indexes).empty?,
         ([2, 5, 8] - o_indexes).empty?,
         ([0, 4, 8] - o_indexes).empty?,
         ([2, 4, 6] - o_indexes).empty?
      puts 'o wins'
    else
      puts 'nope'
    end
  end
end

def new_game
  game = Game.new
  player1 = Player.new(game)
  player2 = Player.new(game)
  move = player_turn(1).to_i
  player1.play(move)
  move = player_turn(2).to_i
  player2.play(move)
  move = player_turn(1).to_i
  player1.play(move)
  move = player_turn(2).to_i
  player2.play(move)
  game.display
  game.win?
end

def player_turn(player_id)
  puts "Player #{player_id} your turn.  Enter a number
  \ncorresponding to the spaces as follows:
  \n     1   2   3
  \n     4   5   6
  \n     7   8   9
  \nEnter your number:"
  gets
end

new_game