class Player
  attr_reader :player_id, :type

  @@player_count = 0

  def initialize()
    @@player_count += 1
    @player_id = @@player_count
    @type = @player_id == 1 ? 'x' : 'o'
  end

  def play(board, position)
    board.space(self.type, position - 1)
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
    x_indexes = self.spaces.each_with_index.map { |type, index| type == "x" ? index : nil}.compact
    o_indexes = self.spaces.each_with_index.map { |type, index| type == "o" ? index : nil}.compact
    case
    when ([0, 1, 2] - x_indexes).empty?,
         ([3, 4, 5] - x_indexes).empty?,
         ([6, 7, 8] - x_indexes).empty?,
         ([0, 3, 6] - x_indexes).empty?,
         ([1, 4, 7] - x_indexes).empty?,
         ([2, 5, 8] - x_indexes).empty?,
         ([0, 4, 8] - x_indexes).empty?,
         ([2, 4, 6] - x_indexes).empty?
      puts "x wins"
    when ([0, 1, 2] - o_indexes).empty?,
         ([3, 4, 5] - o_indexes).empty?,
         ([6, 7, 8] - o_indexes).empty?,
         ([0, 3, 6] - o_indexes).empty?,
         ([1, 4, 7] - o_indexes).empty?,
         ([2, 5, 8] - o_indexes).empty?,
         ([0, 4, 8] - o_indexes).empty?,
         ([2, 4, 6] - o_indexes).empty?
      puts "o wins"
    else
      puts "nope"
    end
  end
end

board_1 = Game.new()

player_1 = Player.new()
player_2 = Player.new()
player_2.play(board_1, 1)
player_2.play(board_1, 4)
player_2.play(board_1, 5)
puts player_1.player_id
puts player_2.player_id
player_3 = Player.new()
board_1.display
board_1.win?