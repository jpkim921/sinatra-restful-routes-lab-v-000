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

# show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end



  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
    # # placeholder is there until the real deal
    # erb :placeholder
  end

end
