class Spaces < ActiveRecord::Base
    belongs_to :users
    has_many :bookings
    has_many :availabilities
end
