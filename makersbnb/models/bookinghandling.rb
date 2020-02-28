  def validate_booking_and_move_on
    if Bookings.valid?(params["start_date"], params["end_date"], params["space_id"])
      @booking = Bookings.create(start_date: params["start_date"], end_date: params["end_date"], users_id: @user_id, spaces_id: @space_id)
      redirect 'booking/confirmation'
    else
      redirect 'booking/error'
    end
  end