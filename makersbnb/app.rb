require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/users'
require_relative './models/spaces'
require_relative './models/bookings'
require_relative './models/availabilities'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  post '/spaces/list' do
    if (Users.where(email: params["email"], password: params["password"]).exists?)
      # save the row for that user as an object to the session
      session[:user] = (Users.find_by email: params["email"])
      redirect '/spaces/list'
    else
      redirect '/login'
    end
  end

  get '/spaces/list' do
    @user_email = session[:user].email
    @spaces = Spaces.all
    erb :'spaces/list'
  end
  
  get '/spaces/create' do
    erb :'spaces/create'
  end

  post '/spaces/create' do
    @user_id = session[:user].id
    Spaces.create(title: params["name_field"], description: params["desc_field"], price_per_night: params["price_field"], users_id: @user_id)
    @space_id = Spaces.last.id
    Availabilities.create(start_date: params["start_date"], end_date: params["end_date"], spaces_id: @space_id)
    redirect '/spaces/confirm'
  end

  get '/spaces/confirm' do
    erb :'spaces/confirm'
  end

  get '/spaces/yours' do
    @user_id = session[:user].id
    @listings = Spaces.where users_id: @user_id
    erb :'spaces/yours'
  end


  get '/spaces/details' do
    @space = Spaces.find_by id: params["space_id"]
    session[:space_id] = params["space_id"]
    erb :'spaces/details'
  end

  post '/booking/confirmation' do 
    @user_id = session[:user].id
    @space_id = params["space_id"]
    if Bookings.valid?(params["start_date"], params["end_date"])
      @booking = Bookings.create(start_date: params["start_date"], end_date: params["end_date"], users_id: @user_id, spaces_id: @space_id)
      redirect 'booking/confirmation'
    else
      redirect 'booking/error'
    end
  end

  get '/booking/confirmation' do
    @booking = Bookings.last
    @space = Spaces.find_by id: @booking.spaces_id
    erb :'/booking/confirmation'
  end
  
  get '/booking/error' do
    flash[:alert] = "This booking is unavailable due to a conflicting booking."
    redirect("/spaces/details?space_id=#{session[:space_id]}")
  end

  get '/logout' do
    session[:user].id = nil
    redirect '/login'
  end

end