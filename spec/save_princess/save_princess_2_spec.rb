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
      let(:grid) { "-----\n-----\nm--p-\n-----\n-----" }
      let(:result) { "RIGHT" }

      it 'goes right' do
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end

    context "and direction is up" do
      let(:grid) { "-----\n-----\n---p-\n-----\n---m-" }
      let(:result) { "UP" }

      it 'goes up' do
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
    context "and direction is down" do
      let(:grid) { "-----\n-----\n---m-\n-----\n---p-" }
      let(:result) { "DOWN" }

      it 'goes down' do
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
  end
  context "can move in multiple directions" do
    context "and there is a shorter move available" do
      let(:grid) { "----p\n-----\n-----\n-----\n---m-" }

      it 'seeks to reduce distance on largest dx axis' do
        result = "UP"
        expect(described_class.nextMove(n,r,c,grid)).to match(result)
      end
    end
    context "and dx and dy are equidistant" do
      let(:grid) { "p----\n-----\n-----\n-----\n----m" }
      it 'goes to a random direction that makes sense' do
        results = []
        (1..50).each do
          results << described_class.nextMove(n,r,c,grid)
        end
        expected = [ "UP" , "LEFT" ]
        expect(results.uniq).to match_array(expected)
      end
    end
  end
end