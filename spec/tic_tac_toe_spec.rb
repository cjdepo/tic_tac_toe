# /spec/tic_tac_toe_spec.rb
require_relative '../game.rb'

#describe Player do  
  #describe #play
    #check for 
#end

describe Game do
    #describe #self.new_game
    #describe #player_turn(player_id)
    #describe #end?
    subject(:game) { described_class.new }
    let(:player1) { instance_double(Player) }
    let(:player2) { instance_double(Player) }

    describe '#run_game' do
        it 'returns win message when top row is xxx' do
            allow(game).to receive(:player_turn).with(1).and_return(1, 2, 3)
            allow(game).to receive(:player_turn).with(2).and_return(6, 7, 9)
            game.instance_variable_set(:@player1, player1)
            game.instance_variable_set(:@player2, player2)
            expect(game.run_game).to receive(:puts).once
        end
    end


    
    describe '#player_turn' do
        it 'returns value when value is valid' do
            allow(game).to receive(:gets).and_return('5')
            expect(game.player_turn(1)).to eq(5)
        end
        it 'returns error message and then value when value is invalid and then valid' do
            allow(game).to receive(:gets).and_return('11', '5')
            expect(game).to receive(:puts).exactly(4).times
            expect(game.player_turn(1)).to eq(5)
        end
        it 'returns error and then value when first guess is already taken and next is valid' do
            game.instance_variable_set(:@spaces, [' ', ' ', ' ', ' ', 'x', ' ', ' ', ' ', ' '])
            allow(game).to receive(:gets).and_return('5', '8')
            expect(game).to receive(:puts).exactly(4).times
            expect(game.player_turn(1)).to eq(8)
        end
    end

        
    describe '#win?' do
        it 'returns true when top row is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[0, 1, 2], []])
            expect(game.win?).to eq(true)
        end
        it 'returns true when middle row is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[3,4,5],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when bottom row is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[6,7,8],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when left column is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[0,3,6],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when middle column is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[1,4,7],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when right column is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[2,5,8],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when left diagonal is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[0,4,8],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when right diagonal is xxx' do
            allow(game).to receive(:spaces_to_indexes).and_return([[2,4,6],[]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when top row is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[0,1,2]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when middle row is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[3,4,5]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when bottom row is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[6,7,8]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when left column is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[0,3,6]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when middle column is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[1,4,7]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when right column is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[2,5,8]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when left diagonal is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[0,4,8]])
            expect(game.win?).to eq(true)
        end
        it 'returns true when right diagonal is ooo' do
            allow(game).to receive(:spaces_to_indexes).and_return([[],[2,4,6]])
            expect(game.win?).to eq(true)
        end
    end
end


    

#end
   