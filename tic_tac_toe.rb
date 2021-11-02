class Player
  attr_reader :player_id

  @@player_count = 0

  def initialize()
    @@player_count += 1
    @player_id = @@player_count
  end

  def self.get_player_count
    @@player_count
  end

  def play(move)
    case move
    when 'x'
      puts 'x'
    when 'o'
      puts 'o'
    else
      puts 'what?'
    end
  end
end

class Move

end

player_1 = Player.new()
player_2 = Player.new()
player_1.play('x')
player_2.play('o')
player_2.play('lsdjf')
puts player_1.player_id
puts player_2.player_id
player_3 = Player.new()
puts Player.get_player_count()