require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/users'
require_relative './models/spaces'
require_relative './models/bookings'
require_relative './models/loginhandling'
require_relative './models/bookinghandling'
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
    return_user_object_if_registered
    proceed_if_logged_in
  end

  get '/spaces/list' do
    proceed_if_logged_in
    @user_email = session[:user].email
    @spaces = Spaces.all
    erb :'spaces/list'
  end
  
  get '/spaces/create' do
    proceed_if_logged_in
    erb :'spaces/create'
  end

  post '/spaces/create' do
    proceed_if_logged_in
    @user_id = session[:user].id
    Spaces.create(title: params["name_field"], description: params["desc_field"], price_per_night: params["price_field"], users_id: @user_id)
    @space_id = Spaces.last.id
    Availabilities.create(start_date: params["start_date"], end_date: params["end_date"], spaces_id: @space_id)
    redirect '/spaces/confirm'
  end

  get '/spaces/confirm' do
    proceed_if_logged_in
    erb :'spaces/confirm'
  end

  get '/spaces/yours' do
    proceed_if_logged_in
    @user_id = session[:user].id
    @listings = Spaces.where users_id: @user_id
    erb :'spaces/yours'
  end

  get '/spaces/yours/requests' do
    proceed_if_logged_in
    @user_id = session[:user].id
    @listings = Spaces.where users_id: @user_id
    erb :'spaces/yours/requests'
  end

  get '/spaces/details' do
    proceed_if_logged_in
    @space = Spaces.find_by id: params["space_id"]
    session[:space_id] = params["space_id"]
    erb :'spaces/details'
  end

  post '/booking/confirmation' do
    proceed_if_logged_in
    @user_id = session[:user].id
    @space_id = params["space_id"]
    validate_booking_and_move_on
  end

  get '/booking/confirmation' do
    proceed_if_logged_in
    @booking = Bookings.last
    @space = Spaces.find_by id: @booking.spaces_id
    erb :'/booking/confirmation'
  end
  
  get '/booking/error' do
    proceed_if_logged_in
    flash[:alert] = "This booking is unavailable due to a conflicting booking."
    redirect("/spaces/details?space_id=#{session[:space_id]}")
  end

  get '/booking/yours' do
    proceed_if_logged_in
    @user_id = session[:user].id
    @bookings = Bookings.where users_id: @user_id
    erb :'/booking/yours'
  end

  get '/logout' do
    proceed_if_logged_in
    session[:user].id = nil
    redirect '/login'
  end

end

