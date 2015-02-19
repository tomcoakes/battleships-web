class Game

  attr_reader :player_one, :player_two, :turn

  def initialize
  end

  def add_player(player)
    @player_one ? @player_two = player : @player_one = player
    @turn = player_one
  end

  def switch_turn
    @turn == @player_one ? @turn = @player_two : @turn = @player_one
  end

  def opponent
    turn == player_one ? player_two : player_one
  end


  def take_turn(coordinate)
    raise 'Game is over.' if over?
    opponent.receive_shot(coordinate)
    switch_turn
  end

  def over?
    player_one.lost? or player_two.lost?
  end

end