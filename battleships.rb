require 'sinatra/base'
require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'
require_relative './lib/water'
require_relative './lib/game'
require_relative './lib/player'

class Battleships < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }
  enable :sessions

  game = Game.new
  board = Board.new(size: 2, content: Cell)
  ship = Ship.new(1)

  get '/' do
    board.grid.values.each { |cell| cell.content = Water.new }
    random_coord = board.grid.keys.sample
    board.place(ship, random_coord)
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    name = params[:name]
      if name.empty?
        erb :new
      else
        @player = Player.new(name)
        game.add_player(@player)
        p game
        @grid = board.grid
        erb :board
      end
  end

  post '/shot' do
    if board.grid[params[:target].to_sym].content.is_a? Ship
      @hit = true
    else
      @hit = false
    end
    erb :board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
