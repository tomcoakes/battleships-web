require 'sinatra/base'

class Battleships < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/new' do
    'What is your name?'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
