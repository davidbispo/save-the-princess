require_relative '../../app/save_princess.rb'
require 'byebug'

RSpec.describe SavePrincess do
  let(:n_rows) { 3 }
  let(:grid) { ["---", "-m-", "p--"] }

  describe '#displayPathtoPrincess'
  context "when a correct input is passed" do
    it 'Rescues the princess' do
      result = "DOWN\nLEFT\n"
      expect do
        described_class.displayPathtoPrincess(n_rows, grid)
      end.to output(result).to_stdout
    end
  end
end