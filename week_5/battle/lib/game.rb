class Game
  attr_reader :players, :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end
  def attack(player)
    player.receive_damage
  end

  def switch_turns
    @current_turn = opponent_of(@current_turn)
  end

  def opponent_of(check_player)
    @players.select {|player| player != check_player}.first
  end

  def game_over?
    losing_players.any?
  end
  def loser
    losing_players.first
  end

  def self.create(player1,player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  private
  def losing_players
    @players.select { |player| player.hit_points <= 0 }
  end

end
