class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |s|
      s.string :title
      s.string :description
      s.integer :price_per_night
      s.references :users, foreign_key: true
    end
  end
end
