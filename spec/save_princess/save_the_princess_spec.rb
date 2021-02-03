require_relative '../../app/save_the_princess.rb'
require 'byebug'

RSpec.describe SaveThePrincess do
  let(:n_rows) { 3 }

  def assert(args, result)
    expect do
      described_class.displayPathtoPrincess(*args)
    end.to output(result).to_stdout
  end

  describe '#displayPathtoPrincess' do
    context 'when in a simple 3x3 grid' do
      context "when princess is up and left" do
        let(:args) { [ n_rows, ["p--", "-m-", "---"] ] }
        let(:expected_result) { "UP\nLEFT\n" }

        it 'Rescues the princess' do
          assert(args, expected_result)
        end
      end
      context "when princess is up and right" do
        let(:args) { [ n_rows, ["--p", "-m-", "---"] ] }
        let(:expected_result) { "UP\nRIGHT\n" }

        it 'Rescues the princess' do
          assert(args, expected_result)
        end
      end
      context "when princess is up and left" do
        let(:args) { [ n_rows, ["---", "-m-", "p--"] ] }
        let(:expected_result) { "DOWN\nLEFT\n" }

        it 'Rescues the princess' do
          assert(args, expected_result)
        end
      end
      context "when princess is down and right" do
        let(:args) { [ n_rows, ["---", "-m-", "--p"] ] }
        let(:expected_result) { "DOWN\nRIGHT\n" }

        it 'Rescues the princess' do
          assert(args, expected_result)
        end
      end
    end
  end
end