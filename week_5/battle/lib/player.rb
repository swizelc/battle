class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    damage = Kernel.rand(1..20)
    @hit_points -= damage
  end

  def gain_points
    points = Kernel.rand(1..20)
    if @hit_points + points > 60
      points = 60 - @hit_points
    end
    @hit_points += points
  end

end
