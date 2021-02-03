require 'byebug'
require_relative '../../app/save_princess_two.rb'

RSpec.describe SavePrincessTwo do
  let(:n_rows) { 3 }
  let(:n) { 5 }
  let(:r) { 2 }
  let(:c) { 3 }
  let(:args) { [ n,r,c,grid ] }

  def assert(args, result)
    expect do
      described_class.nextMove(n,r,c,grid)
    end.to output(result).to_stdout
  end

  describe '#next_move'
  context "can only move in one direction with an obvious direction" do
    context "and direction is left" do
      let(:grid) { "-----\n-----\np--m-\n-----\n-----".split("\n") }

      it 'goes left' do
        result = "LEFT"
        assert(args,result)
      end
    end
    context "and direction is right" do
      let(:grid) { "-----\n-----\nm--p-\n-----\n-----".split("\n") }
      let(:result) { "RIGHT" }

      it 'goes right' do
        assert(args,result)
      end
    end

    context "and direction is up" do
      let(:grid) { "-----\n-----\n---p-\n-----\n---m-".split("\n") }
      let(:result) { "UP" }

      it 'goes up' do
        assert(args,result)
      end
    end
    context "and direction is down" do
      let(:grid) { "-----\n-----\n---m-\n-----\n---p-".split("\n") }
      let(:result) { "DOWN" }

      it 'goes down' do
        assert(args,result)
      end
    end
  end
  context "can move in multiple directions" do
    context "and there is a shorter move available" do
      let(:grid) { "----p\n-----\n-----\n-----\n---m-".split("\n") }

      it 'seeks to reduce distance on largest dx axis' do
        result = "UP"
        assert(args,result)
      end
    end
    context "and dx and dy are equidistant" do
      let(:grid) { "p----\n-----\n-----\n-----\n----m".split("\n") }
      it 'goes to a random direction that makes sense' do
        result = described_class.nextMove(n,r,c,grid)
        expected = [ "UP" , "LEFT" ]
        expect(expected).to include(result)
      end
    end
  end
end