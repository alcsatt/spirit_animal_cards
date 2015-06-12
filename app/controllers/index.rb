
get '/' do
  erb :'landing'
  if session[:user_id]
    @user = current_user
    @decks = DefaultDeck.all
  end
  erb :landing
end

delete '/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  @user = find_user_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @messages = ["invalid username or password"]
    erb :login

  end
end

## signup form
get '/signup' do
  erb :signup
end

## create user
post '/signup' do
  user = find_user_by_email(params[:email])       #User.find_by(email: params[:email])
  unless user
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @messages = ["user already exists"]
    erb :signup
  end
end
