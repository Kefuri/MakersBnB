class Bookings < ActiveRecord::Base
    belongs_to :spaces
    belongs_to :users

    def self.must_not_overlap(start_date, end_date)
        results = self.connection.execute("SELECT * FROM bookings WHERE start_date <= DATE '#{end_date}' AND end_date >= DATE '#{start_date}' ")
        if results.to_a.empty?
            return true
        else
            return false
        end
    end  
    def self.must_be_avaliable(start_date, end_date)
        results = self.connection.execute("SELECT * FROM availabilities WHERE start_date <= DATE '#{start_date}' AND end_date >= DATE '#{end_date}' ")
        if results.to_a.empty?
            return false
        else
            return true
        end
    end           
    def self.your_pending_requests(user_id)
        Bookings.where Spaces.users_id = user_id, approval_status: "Pending"
    end
    def self.valid?(start_date,end_date)
        Bookings.must_be_avaliable(start_date,end_date) && Bookings.must_not_overlap(start_date,end_date)
    end
end