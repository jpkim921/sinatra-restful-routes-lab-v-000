class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  # index action
  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  # new action
  get '/recipes/new' do
    erb :new
  end

  # show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
    # # placeholder is there until the real deal
    # erb :placeholder
  end

  # edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipe/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]

    erb :show
  end

  # update action

  get '/recipes/:id/update' do
    redirect '/recipes/:id/edit'
  end




end
