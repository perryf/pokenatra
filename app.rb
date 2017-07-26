require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/pokemon'
require_relative 'models/trainer'

get '/' do #HOME PAGE
  @trainers = Trainer.all
  @pokemons = Pokemon.all
  erb :"home"
end

get '/trainers' do #READ
  @trainers = Trainer.all
  erb :"trainers/index"
end

get '/trainers/new' do #CREATE
  @pokemons = Pokemon.all
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
