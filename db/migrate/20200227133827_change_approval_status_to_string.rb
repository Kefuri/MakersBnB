class ChangeApprovalStatusToString < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :approval_status, :string, :default => "Pending"
  end
end
