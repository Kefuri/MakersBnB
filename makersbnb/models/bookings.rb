class Bookings < ActiveRecord::Base
    belongs_to :spaces
    belongs_to :users
end