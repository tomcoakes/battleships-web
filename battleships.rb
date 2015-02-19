require 'sinatra/base'
require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'

class Battleships < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }

  board = Board.new(size: 2, content: Cell)
  ship = Ship.new(1)
  board.place(ship, :A2)

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    @name = params[:name]
      if @name.empty?
        erb :new
      else
        @grid = board.grid
        puts @grid 
        erb :board
      end
  end

  post '/shot' do
      @hit ||= false
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
