
get '/pokemons' do #READ
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/new' do #CREATE
  @trainers = Trainer.all
  erb :"pokemons/new"
end

post '/pokemons' do #CREATE
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get '/pokemons/:id' do #READ
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

get '/pokemons/:id/edit' do #UPDATE
  @pokemon = Pokemon.find(params[:id])
  @trainers = Trainer.all
  erb :"pokemons/edit"
end

put '/pokemons/:id' do #UPDATE
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

delete '/pokemons/:id' do #DESTROY
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end
