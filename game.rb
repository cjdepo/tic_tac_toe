#/tic_tac_toe/game.rb
require_relative 'player.rb'

class Game
    attr_reader :spaces
  
    def initialize
      @spaces = [' ', ' ', ' ',
                 ' ', ' ', ' ',
                 ' ', ' ', ' ']
    end

    def generate_players
        case
        when !@player1
            @player1 = Player.new(self)
        when !@player2
            @player2 = Player.new(self)
        end
    end

  
    def run_game
      while true
        position = self.player_turn(1).to_i
        @player1.play(position)
        self.display
        if self.win?
          puts "Player 1 wins!"
          break
        end
        if self.end?
          puts "Tie!"
          break
        end
  
        position = self.player_turn(2).to_i
        @player2.play(position)
        self.display
        if self.win?
          puts "Player 2 wins!"
          break
        end
        if self.end?
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
  
    def spaces_to_indexes
      x_indexes = spaces.each_with_index.map { |type, index| type == "x" ? index : nil}.compact
      o_indexes = spaces.each_with_index.map { |type, index| type == "o" ? index : nil}.compact
      return x_indexes, o_indexes
    end
  
  
    def win?
      x_indexes = self.spaces_to_indexes[0]
      o_indexes = self.spaces_to_indexes[1]
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