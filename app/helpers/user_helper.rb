def current_user
  session[:user_id] ? User.find(session[:user_id]) : nil
end

# def create_user(user_data)
#   User.create(email: user_data[:email], password: user_data[:pw])
# end

# def find_user_by_email(email)
#   User.find_by(email: email)
# end
