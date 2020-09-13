require './lib/game_controller'

describe "GameController" do
  let(:controller) { GameController.new }
  it "Creates a gameboard when initialized" do
    expect(controller.gameboard).to be
  end

  context "#make_move" do
    it "can make a move and change board state" do
      player = double("Player")
      allow(player).to receive(:choose_column).and_return(1)
      controller.gameboard.player1 = player
      controller.make_move
      expect(controller.gameboard.state[5][0]).to eql("\u{1F534}")
      expect(controller.gameboard.state[0][0]).not_to eql("\u{1F534}")
    end

    it "changes turns after a move" do
      player1 = double("Player")
      allow(player1).to receive(:choose_column).and_return(1)
      controller.gameboard.player1 = player1
      player2 = double("Player")
      allow(player2).to receive(:choose_column).and_return(7)
      controller.gameboard.player2 = player2
      controller.make_move
      expect(controller.turn).to eql(2)
      controller.make_move
      expect(controller.turn).to eql(1)
    end
  end

  context "#check_board" do
    it "Detects a win in a row" do
      player1 = double("Player")
      allow(player1).to receive(:choose_column).and_return(1,1,1,1)
      controller.gameboard.player1 = player1
      player2 = double("Player")
      allow(player2).to receive(:choose_column).and_return(7,8,9)
      controller.gameboard.player2 = player2
      7.times do
        controller.make_move
      end
      controller.check_board
      expect(controller.game_over?).to be true
    end
  end
end