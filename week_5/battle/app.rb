require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'
class Battle < Sinatra::Base
  run! if app_file == $0
  enable :sessions

  get '/' do
    erb :index
  end
  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    $game.attack($game.players[1])
    @game.switch_turns
    erb :attack
  end

end
