require_relative '../../app/save_princess2.rb'
require 'byebug'

RSpec.describe SavePrincess2 do
  let(:n_rows) { 3 }
  let(:grid) { '-----\n-----\n-----\n----m\n-p---' }

  describe '#next_move'
  context "when a correct input is passed" do
    it 'Rescues the princess' do
      result = "LEFT"
      expect do
        described_class.nextMove(n,r,c,grid)
      end.to output(result).to_stdout
    end
  end
end