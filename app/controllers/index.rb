get '/' do
  @categories = Category.all
  if params[:key]
    @key = params[:key]
    p @key
  end
  erb :'categories/index'
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  @articles = @category.articles.order("created_at DESC")
  erb :'categories/show'
end

get '/articles/new' do
  @article = Article.new
  @categories = Category.all
  erb :'articles/new'
end


post '/articles/:id/update' do
  @article = Article.find(params[:id])
  @article.update_attributes(params[:article])
  redirect '/'
end

get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  @categories = Category.all
  erb :'articles/edit'
end


post '/articles' do
  @encryption_key = SecureRandom.hex(6)
  @article = Article.new(params[:article])
  @article.encryption_key = @encryption_key
  @article.save

  redirect to("/?key=#{@encryption_key}")
end


get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :'articles/show'
end
