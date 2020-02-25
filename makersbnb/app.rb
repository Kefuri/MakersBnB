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
      # save the row for that user as an object to the session
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
  
  get '/listings/create' do
    erb :create_listing
  end

  post '/listings/create' do
    @user_id = session[:user].id
    Spaces.create(title: params["name_field"], description: params["desc_field"], price_per_night: params["price_field"], users_id: @user_id)
    redirect '/listings'
  end

  get '/listings/confirm_listing' do
    erb :confirm_listing
  end

  get '/listings' do
    @user_id = session[:user].id
    @listings = Spaces.where users_id: @user_id
    p "EEEEEEEEEEEEEEEEEEEEEEEE"
    erb :listings
  end
end