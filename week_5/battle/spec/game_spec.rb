require 'game'

RSpec.describe Game do
  let(:player1) {double("player1", :hit_points => 60)}
  let(:player2) {double("player2" ,:hit_points => 60)}
  let(:dead_player) {double("dead_player", :hit_points => 0)}
  subject {Game.new(player1, player2)}

  describe '#attack' do
    it 'damages the player' do
      expect(player1).to receive(:receive_damage)
      subject.attack(player1)
    end
  end
  describe '#current_turn' do
    it 'starts as player 1' do
      expect(subject.current_turn).to eq player1
    end
  end
  describe 'switch_turns' do
    it 'switches the turn' do
      subject.switch_turns
      expect(subject.current_turn).to eq player2
    end
  end
  describe 'game_over?' do
    it 'returns false if game is not over' do
      finished_game = Game.new(player1, dead_player)
      expect(finished_game.game_over?).to eq true
    end
  end

  describe 'loser' do
    it 'returns the losing player' do
      finished_game = Game.new(player1, dead_player)
      expect(finished_game.loser).to eq dead_player
    end
  end

end
