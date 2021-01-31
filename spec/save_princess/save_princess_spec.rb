require_relative '../../app/save_princess.rb'

RSpec.describe SavePrincess do
  let(:input) { 
   "5
    2 3
    -----
    -----
    p--m-
    -----
    -----"
   }

   let(:result){
     "DOWN
      LEFT"
   }

  describe '#parse_board'
  context "first test" do
  let(:title) { "A new Task" }

    it 'Parses the board' do
      expect(described_class.parse_board(input)).to eq(result)
    end
  end
end
