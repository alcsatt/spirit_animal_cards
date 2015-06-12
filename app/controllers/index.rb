get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @decks = Deck.all
  end
  erb :landing
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @messages = ["invalid username or password"]
    erb :login

  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.find_by(params[:email])
  unless user
    @user = User.create(email: params[:email], password: params[:password])
    redirect '/'
  else
    @messages = ["user already exists"]
    erb :signup
  end
end
