class Bookings < ActiveRecord::Base
    belongs_to :spaces
    belongs_to :users

    def self.bookings_must_not_overlap(start_date, end_date)
        p start_date
        p end_date
        results = self.connection.execute("SELECT * FROM bookings WHERE start_date <= DATE '#{end_date}' AND end_date >= DATE '#{start_date}' ")
        if results.to_a.empty?
            return true
        else
            return false
        end
    end       
    def self.your_pending_requests(user_id)
        Bookings.where Spaces.users_id = user_id, approval_status: "Pending"
    end
               
end