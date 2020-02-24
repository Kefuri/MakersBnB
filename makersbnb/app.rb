require 'sinatra/activerecord'
require 'sinatra/base'
require_relative './models/users'
require_relative './models/spaces'
require_relative './models/bookings'
require_relative './models/listings'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/listings/create' do
    erb :create_listing
  end

  get '/listings/confirm_listing' do
    erb :confirm_listing
  end
end