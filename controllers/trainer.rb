get '/trainers' do #READ
  @trainers = Trainer.all
  erb :"trainers/index"
end

get '/trainers/new' do #CREATE
  erb :"trainers/new"
end

post '/trainers' do #CREATE
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

get '/trainers/:id' do #READ
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end

get '/trainers/:id/edit' do #UPDATE
  @trainer = Trainer.find(params[:id])
  @pokemons = Pokemon.all
  erb :"/trainers/edit"
end

put '/trainers/:id' do #UPDATE
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end

delete '/trainers/:id' do #DESTROY
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect "/trainers"
end
