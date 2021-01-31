require 'byebug'
require_relative '../../app/save_princess_two.rb'

RSpec.describe SavePrincessTwo do
  let(:n_rows) { 3 }
  let(:grid) { '-----\n-----\n-----\n----m\n-p---' }
  let(:n) { 5 }
  let(:r) { 2 }
  let(:c) { 3 }

  describe '#next_move'
  context "when a correct input is passed" do
    it 'Rescues the princess' do
      result = "LEFT"
      expect(described_class.nextMove(n,r,c,grid)).to match(result)
    end
  end
end