class Board
	attr_reader :grid

	def initialize(options)
		@grid = {}
    size = options[:size]
		("A"..(size + 64).chr).each do |letter|
			(1..size).each do |number|
				@grid[(letter + number.to_s).to_sym] = options[:content].new
			end
		end
	end

  def shoot_at(coord)
    raise "You can't hit the same cell twice" if grid[coord].hit?
    grid[coord].shoot
  end

  def place(ship, coordinate, orientation = :horizontally)
    get_coordinates(coordinate, ship.size, orientation).each do |coord|
      grid[coord].content = ship
    end
  end

  def get_coordinates(start, size, direction)
    return_array = [start]
    (size - 1).times {return_array << get_next(return_array.last, direction)}
    return_array
  end

  def get_next(coord, direction)
    direction == :horizontally ? coord.next : coord.to_s.reverse.next.reverse.to_sym
  end

  def floating_ships?
    ship_cells = grid.values.select do|cell|
      cell.content.respond_to?(:sunk?)
    end.uniq
    !ship_cells.map(&:content).all?(&:sunk?)
  end

end