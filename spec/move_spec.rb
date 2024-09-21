require_relative '../moverover'

RSpec.describe 'Move' do
    it "moves rover as per the requirement" do
        move = Move.new(1,2,'N') # Initial position
        move.run_commands('LMLMLMLMM') # Series of instructions
        expect(move.position).to eq([1,3,'N']) # Final expected git puposition
    end
end    