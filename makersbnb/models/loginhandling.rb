def return_user_object_if_registered
  if (Users.where(email: params["email"], password: params["password"]).exists?)
    session[:user] = (Users.find_by email: params["email"])
    redirect '/spaces/list'
  else
    redirect '/login'
  end
end

def proceed_if_logged_in
  redirect '/login' if session[:user] == nil
end