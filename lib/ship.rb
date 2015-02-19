class Ship

	attr_reader :length

	def initialize(length = 3)
		@length = length
		@hits = 0
	end

	def self.submarine
		new 2
	end

	def self.aircraft_carrier
		new 5
	end

	def hit
		@hits += 1
	end

	def sunk?
		hits >= length
	end

	alias_method :size, :length

private

	def hits
		@hits
	end



end