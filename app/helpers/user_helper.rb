def current_user
  if session[:user_id]
    User.find(session[:user_id])
  else
    nil
  end
end

def find_user_by_email(email)
  User.find_by(email: email)
end
