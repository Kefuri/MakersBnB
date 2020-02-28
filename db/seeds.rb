# 10 of everything

user_list =[
  ["random_user@wemail.com", "RandoUser1"],
  ["dichardo_ruis@yourmail.com","WeWillRock7"],
  ["joshouttahere@megamail.com", "canYouNot89"],
  ["davidliketodothat@yoohoo.com", "ItDObeLikeDat1"],
  ["ziad@ziad.com", "WeCantKeepUp"]
]

user_list.each do |email, password|
  Users.create(email: email, password: password)
end

spaces_list = [
  ["Josh's Basement", "A cute, cozy basement with ping pong table and fairy lights!", "70", "4"],
  ["The Rooftop", "Want to sleep under the stars... In London? The rooftop can do that for you! 50% more pidgeons!", "35", "3"],
  ["Ziad's Pad", "Yo dude, I'm Ziad, and welcome to my crib. Yeah we got the playstation! Bunk beds though...", "50", "6"],
  ["David's Dorm", "Need a minimal, low cost room to spend a few nights in London? I'd love to have you!", "30", "5"],
  ["The Fake Paris", "Nice apartment with a great view of the local electric pylon outside. Don't touch.", "55", "5"]
]

spaces_list.each do |title, description, ppn, owner|
  Spaces.create(title: title, description: description, price_per_night: ppn, users_id: owner)
end

bookings_list = [
  ["2020-02-28", "2020-03-04", "3", "5"],
  ["2020-03-01", "2020-03-04", "5", "7"],
  ["2020-03-02", "2020-03-04", "2", "9"],
  ["2020-03-18", "2020-03-24", "1", "8"],
  ["2020-03-07", "2020-03-09", "6", "9"]
]

bookings_list.each do |start, end_date, user, space|
  Bookings.create(start_date: start, end_date: end_date, users_id: user, spaces_id: space)
end

