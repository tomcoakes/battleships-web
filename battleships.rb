require 'sinatra/base'
require_relative './lib/board'
require_relative './lib/cell'

class Battleships < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }

  board = Board.new(size: 2, content: Cell)

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
        erb :board
      end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
