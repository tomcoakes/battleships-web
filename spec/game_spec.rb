require 'game'

describe Game do
  let(:game){Game.new}
  let(:player_one){double :player, lost?: false}
  let(:player_two){double :player, lost?: false}

  context "on set up" do

    it "can add a player" do
      game.add_player(player_one)
      expect(game.player_one).to eq player_one
    end

    it 'can add the second player' do
      game.add_player(player_one)
      game.add_player(player_two)
      expect(game.player_two).to eq player_two
    end

  end

  context "when game is ready" do
    before(:each) do
      game.add_player(player_one)
      game.add_player(player_two)
    end

    it "knows who's turn it is" do
      expect(game.turn).to eq player_one
    end

    it "knows who the opponent is" do
      expect(game.opponent).to eq player_two
    end

    it 'can switch turns' do
      game.switch_turn
      expect(game.turn).to eq player_two
    end

    it "can let a player take a turn" do
      expect(player_two).to receive(:receive_shot).with(:A1)
      game.take_turn(:A1)
    end

    it 'switches turns after making a turn' do
      allow(player_two).to receive(:receive_shot).with(:A1)
      expect(game).to receive(:switch_turn)
      game.take_turn(:A1)
    end

    it "does't take a turn if there is a winner" do
      allow(player_two).to receive(:receive_shot).with(:A1)
      allow(game).to receive(:over?).and_return true
      expect{game.take_turn(:A1)}.to raise_error "Game is over."
    end

    it "knows a game not over when either player hasn't lost" do
      expect(game.over?).to eq false
    end

    it "knows a game is over when  player one has lost" do
      allow(player_one).to receive(:lost?).and_return true
      expect(game).to be_over
    end


    it "knows a game is over when  player two has lost" do
      allow(player_two).to receive(:lost?).and_return true
      expect(game).to be_over
    end

  end

end







