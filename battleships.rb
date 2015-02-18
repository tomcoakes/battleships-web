require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }
  enable :sessions

  game = Game.new

  get '/' do
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
        @player = Player.new
        @player.name=(name)
        game.add_player(@player)
        erb :welcome
      end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
