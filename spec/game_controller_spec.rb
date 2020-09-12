require './lib/game_controller'

describe "GameController" do
  let(:controller) { GameController.new }
  it "Creates a gameboard when initialized" do
    expect(controller.gameboard).to be
  end

  context "#make_move" do
    it "can make a move and change board state" do
      allow(controller).to receive(:make_move).and_return(1)
      controller.make_move
      expect(controller.gameboard.state[0][0]).to eql("X")
    end
  end
end