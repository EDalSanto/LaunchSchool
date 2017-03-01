require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => 'super_secret'
  set :erb, :escape_html => true
end

helpers do
  def invalid_bet?(amount)
    amount < 1 || amount > session[:money]
  end

  def invalid_bet_message
    "Bets must be between $1 and $#{session[:money]}, your current total.
    Please enter a valid bet amount without the $."
  end

  def broke?
    session[:money] <= 0
  end

  def redirect_invalid_bet
    session[:message] = invalid_bet_message
    redirect '/bet_page'
  end

  def correct_guess?(random_number, guess)
    random_number == guess
  end
end

get '/' do
  redirect '/bet_page'
end

get '/bet_page' do
  session[:money] = 100 if session[:money].nil?

  redirect '/broke' if broke?

  erb :bet_page
end

post '/make_bet' do
  bet = params[:bet].to_i
  redirect_invalid_bet if invalid_bet?(bet)

  guess = params[:guess].to_i
  random_number = (1..3).to_a.sample

  if correct_guess?(random_number, guess)
    session[:money] += bet
    session[:message] = "You have guessed correctly!"
  else
    session[:money] -= bet
    session[:message] = "You guessed #{guess},\
                          but the number was #{random_number}."
  end

  redirect '/bet_page'
end

get '/broke' do
  erb :broke
end

post '/new_game' do
  session[:money] = 100

  redirect '/bet_page'
end
