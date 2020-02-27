class ChangeDatetimeToDateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    change_column :availabilities, :start_date, :date
    change_column :availabilities, :end_date, :date
  end
end
