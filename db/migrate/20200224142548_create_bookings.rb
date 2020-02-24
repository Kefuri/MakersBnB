class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |b|
      b.datetime :start_date
      b.datetime :end_date
      b.references :users, foreign_key: true
      b.references :spaces, foreign_key: true
    end
  end
end
