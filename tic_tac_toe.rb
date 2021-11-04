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
    board.space(self.type, position)
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
    p self.spaces[1..3]
    p self.spaces[4..6]
    p self.spaces[7..9]
  end

  def win?()
  end
end

board_1 = Game.new()

player_1 = Player.new()
player_2 = Player.new()
player_1.play(board_1, 1)
player_2.play(board_1, 5)
player_2.play(board_1, 9)
puts player_1.player_id
puts player_2.player_id
player_3 = Player.new()
puts Player.get_player_count()
board_1.display
board_1.win?