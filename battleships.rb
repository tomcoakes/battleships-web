require 'sinatra/base'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, "views") }

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
        erb :welcome
      end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
