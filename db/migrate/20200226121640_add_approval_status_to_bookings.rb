class AddApprovalStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :approval_status, :boolean
  end
end
