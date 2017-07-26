get '/teams' do #READ
  @teams = Team.all
  erb :"teams/index"
end

get '/teams/new' do #CREATE
  erb :"teams/new"
end

post '/teams' do #CREATE
  @team = Team.create(params[:team])
  @trainers = Trainer.all
  redirect "/teams/#{@team.id}"
end

get '/teams/:id' do #READ
  @team = Team.find(params[:id])
  erb :"/teams/show"
end

get '/teams/:id/edit' do #UPDATE
  @team = Team.find(params[:id])
  @trainers = Trainer.all
  erb :"/teams/edit"
end

put '/teams/:id' do #UPDATE
  @team = Team.find(params[:id])
  @team.update(params[:team])
  redirect "/teams/#{@team.id}"
end

delete '/teams/:id' do #DESTROY
  @team = Team.find(params[:id])
  @team.destroy
  redirect "/teams"
end
