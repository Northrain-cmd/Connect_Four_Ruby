require './lib/player'

describe 'Player' do
  let(:player) { Player.new("Kris") }
  it 'Creates a player with a custom name' do
    expect(player.name).to eql("Kris")
  end

  context "#choose_column" do
    it "Can choose a column to make a move" do
      allow(player).to receive(:gets).and_return("5")
      expect(player.choose_column).to eql(5)
    end

    it "Doesn't return an invalid number" do
      allow(player).to receive(:gets).and_return("Hello","0","8","5")
      expect(player.choose_column).to eql(5)
    end
  end
end