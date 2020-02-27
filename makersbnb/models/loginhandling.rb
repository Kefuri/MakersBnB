def proceed_if_logged_in
  redirect '/login' if session[:user] == nil
end