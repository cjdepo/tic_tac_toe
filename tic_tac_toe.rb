class Player
  attr_reader :player_id, :type

  @@player_count = 0

  def initialize()
    @@player_count += 1
    @player_id = @@player_count
    @type = @player_id == 1 ? 'x' : 'o'
  end

  def play(board, position)
    board.space(type, position - 1)
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

  def space(move, position)
    @spaces[position] = move
  end

  def display()
    p spaces[0..2]
    p spaces[3..5]
    p spaces[6..8]
  end

  def win?()
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

board1 = Game.new

player1 = Player.new
player2 = Player.new
player2.play(board1, 1)
player2.play(board1, 5)
player2.play(board1, 9)
puts player1.player_id
puts player2.player_id
player3 = Player.new
board1.display
board1.win?