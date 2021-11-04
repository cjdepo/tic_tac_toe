class Player
  attr_reader :player_id, :type

  @@player_count = 0

  def initialize()
    @@player_count += 1
    @player_id = @@player_count
    @type = @player_id == 1 ? 'x' : "o"

  end

  def self.get_player_count
    @@player_count
  end

  def play(board, position)
    board.space(self.type, position - 1)
  end

end

class Game
  attr_reader :spaces

  def initialize()
    @spaces = [ ' ', ' ', ' ',
                ' ', ' ', ' ',
                ' ', ' ', ' ']
  end
  
  def clear()
    @spaces = [ ' ', ' ', ' ',
                ' ', ' ', ' ',
                ' ', ' ', ' ']
  end
  
  def space(move, position)
    @spaces[position] = move
  end

  def display()
    p self.spaces[0..2]
    p self.spaces[3..5]
    p self.spaces[6..8]
  end

  def win?()
    x_indexes = self.spaces.each_with_index.map { |type, index| type == "x" ? index : nil}.compact
    o_indexes = self.spaces.each_with_index.map { |type, index| type == "o" ? index : nil}.compact
    case
    when ([1, 2, 3] - x_indexes).empty?,
         ([4, 5, 6] - x_indexes).empty?,
         ([7, 8, 9] - x_indexes).empty?,
         ([1, 4, 7] - x_indexes).empty?,
         ([2, 5, 8] - x_indexes).empty?,
         ([3, 6, 9] - x_indexes).empty?,
         ([1, 5, 9] - x_indexes).empty?,
         ([3, 5, 7] - x_indexes).empty?
      puts "x wins"
    when ([1, 2, 3] - o_indexes).empty?,
         ([4, 5, 6] - o_indexes).empty?,
         ([7, 8, 9] - o_indexes).empty?,
         ([1, 4, 7] - o_indexes).empty?,
         ([2, 5, 8] - o_indexes).empty?,
         ([3, 6, 9] - o_indexes).empty?,
         ([1, 5, 9] - o_indexes).empty?,
         ([3, 5, 7] - o_indexes).empty?
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
player_2.play(board_1, 7)
puts player_1.player_id
puts player_2.player_id
player_3 = Player.new()
puts Player.get_player_count()
board_1.display
board_1.win?