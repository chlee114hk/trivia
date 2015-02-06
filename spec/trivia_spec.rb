require 'spec_helper'

describe "trivia game spec" do
  before :all do
    @game = Trivia::Game.new
  end

  it "add player" do
    @game.add("Chat")
    expect(@game.how_many_players).to eq(1)
  end

  it "is playable" do
    @game.add("Pat")
    expect(@game.is_playable?).to eq(true)
  end

  it "first round roll" do
    2.times do |i|
      @game.roll(i + 1)
      expect(@game.places[@game.current_player]).to eq(i + 1)
      @game.wrong_answer
      pp @game.current_player
    end
  end

  it "second round roll" do
    in_penalty_box = [true, true]
    is_getting_out_of_penalty_box = [true, false]
    2.times do |i|
      @game.roll(i + 1)
      expect(@game.in_penalty_box[@game.current_player]).to eq(in_penalty_box[@game.current_player])
      expect(@game.is_getting_out_of_penalty_box).to eq(is_getting_out_of_penalty_box[@game.current_player])
      @game.was_correctly_answered
    end
  end
end