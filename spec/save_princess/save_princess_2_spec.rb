require 'byebug'
require_relative '../../app/save_princess_two.rb'

RSpec.describe SavePrincessTwo do
  let(:n_rows) { 3 }
  let(:n) { 5 }
  let(:r) { 2 }
  let(:c) { 3 }

  describe '#next_move'
  context "can only move in one direction with an obvious direction" do
    context "and direction is left" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }

      it 'goes left' do
        result = "LEFT"
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
    context "and direction is right" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }
      let(:result) { "RIGHT" }

      it 'goes right' do
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end

    context "and direction is up" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }
      let(:result) { "UP" }

      it 'goes up' do
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
    context "and direction is dowm" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }
      let(:result) { "DOWN" }

      it 'Finds the quickest movement' do
        result = "DOWN"
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
  end
  context "can move in multiple directions" do
    context "and there is a shorter move available" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }

      it 'goes to shortest distance movement' do
        result = "LEFT"
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
    context "and moves are equidistant in both directions" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----" }

      it 'goes randomly to a direction in the correct sense' do
        result = "LEFT"
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
  end
end