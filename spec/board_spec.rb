require './lib/board'

describe "GameBoard" do
  let(:board) { GameBoard.new }
  it "creates an empty board as an array of dots" do
    expect(board.state).to be_instance_of(Array)
    expect(board.state.length).to eql(6)
    expect(board.state[5]).to all(be_nil)
  end

  context "#show_board" do
    it "outputs the board state to console" do
      expect{ board.show_board }.to output.to_stdout
    end
  end

  context "#change_state" do
    it "can add marks to a column" do
      board.change_state(1)
      expect(board.state[5][0]).to eql("\u{1F534}")
      expect(board.state[1][0]).to be_nil
    end

    it "can add marks depending on the player" do
     board.change_state(1, 1)  
     expect(board.state[5][0]).to eql("\u{1F534}") 
     board.change_state(1, 2)  
     expect(board.state[4][0]).to eql("\u{1F535}")  
    end

    it "can add multiple marks to a column keeping order" do
      expect(board.state[0][0]).to be_nil
      board.change_state(1)
      board.change_state(1)
      board.change_state(1)
      expect(board.state[5][0]).to eql("\u{1F534}")
      expect(board.state[4][0]).to eql("\u{1F534}")
      expect(board.state[3][0]).to eql("\u{1F534}")
      expect(board.state[2][1]).to be_nil
    end

    it "returns nil if the column is invalid" do
      expect(board.change_state(7)).not_to be_nil
      expect(board.change_state(8)).to be_nil
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