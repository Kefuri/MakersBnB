require 'sinatra/activerecord'
require 'sinatra/base'
require_relative './models/users'
require_relative './models/spaces'
require_relative './models/bookings'
require_relative './models/listings'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/login' do
    Users.create(email: params["email"], password: params["password"])
    redirect '/login'
  end

  get '/login' do
    erb(:login)
  end

  post '/spaces' do
    if (Users.where(email: params["email"], password: params["password"]).exists?)
      session[:user] = (Users.find_by email: params["email"])
      redirect '/spaces'
    else
      redirect '/login'
    end
  end

  get '/spaces' do
    @user_email = session[:user].email
    erb(:spaces)
  end

end