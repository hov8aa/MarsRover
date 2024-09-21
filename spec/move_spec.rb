require_relative '../moverover'

RSpec.describe 'Move' do
    it "moving rover" do
        move = Move.new(1,2,'N') # Initial position
        move.run_commands('LMLMLMLMM') # Series of instructions
        expect(move.position).to eq([1,3,'N']) # Final expected position
    end
end    