class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |a|
      a.datetime :start_date
      a.datetime :end_date
      a.references :spaces, foreign_key: true
    end
  end
end
