require './lib/board'

describe "GameBoard" do
  let(:board) { GameBoard.new }
  it "creates an empty board as an array of dots" do
    expect(board.state).to be_instance_of(Array)
    expect(board.state.length).to eql(6)
    expect(board.state[5]).to all(eql("."))
  end

  context "#show_board" do
    it "outputs the board state to console" do
      expect{ board.show_board }.to output.to_stdout
    end
  end

  context "#init_players" do
    it "creates two players with custom names" do
      allow(board).to receive(:gets).and_return("Kris", "Don")
      board.init_players
      expect(board.player1.name).to eql("Kris")
      expect(board.player2.name).to eql("Don")
    end
  end
end