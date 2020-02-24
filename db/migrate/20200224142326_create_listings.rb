class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |l|
      l.datetime :start_date
      l.datetime :end_date
      l.references :spaces, foreign_key: true
    end
  end
end
