require_relative '../../app/save_princess.rb'
require 'byebug'

RSpec.describe SavePrincess do
  let(:input) { 
   "3
   ---
   -m-
   p--"
   }

   let(:result){
     "DOWN
      LEFT"
   }

  describe '#parse_board'
  context "first test" do
  let(:title) { "A new Task" }

    it 'Parses the board' do
      result = {
        'player' => [1, 1],
        "princess" => [2, 0]
      }
      expect(described_class.parse_board(input)).to match(result)
    end
  end
end
