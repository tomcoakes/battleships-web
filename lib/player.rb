class Player

  attr_reader :name
  attr_accessor :board

  def initialize(name)
    @name = name
  end

  def lost?
    !board.floating_ships?
  end

  def receive_shot(coordinate)
    board.shoot_at(coordinate)
  end

end