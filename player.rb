
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