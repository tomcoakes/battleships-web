require 'player'

describe Player do
  let(:player){Player.new("Bob")}
  let(:board){double :board}

  before{player.board = board}

  it "has a name" do
    expect(player.name).to eq "Bob"
  end

  it "can have a board" do
    expect(player.board).to eq board
  end

  it "can know if they have lost" do
    allow(board).to receive(:floating_ships?).and_return false
    expect(player.lost?).to eq true
  end

  it "can know if they haven't lost" do
    allow(board).to receive(:floating_ships?).and_return true
    expect(player.lost?).to eq false
  end

  it "can recieve a shot" do
    expect(board).to receive(:shoot_at).with :A1
    player.receive_shot(:A1)
  end
end
