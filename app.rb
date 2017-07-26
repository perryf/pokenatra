require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/pokemon'
require_relative 'models/trainer'
require_relative 'models/team'
require_relative 'controllers/pokemon'
require_relative 'controllers/trainer'
require_relative 'controllers/team'

get '/' do #HOME PAGE
  @trainers = Trainer.all
  @pokemons = Pokemon.all
  @teams = Team.all
  erb :"home"
end
