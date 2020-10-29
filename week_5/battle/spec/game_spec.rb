require 'game'

RSpec.describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
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
end
