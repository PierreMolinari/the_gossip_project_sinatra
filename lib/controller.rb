require_relative 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: {id_gossip: Gossip.find(params["id"])}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {id_gossip: Gossip.find(params["id"])}
  end

  post '/gossips/:id/edit' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).update(params["id"])
    redirect "/gossips/" + params["id"]
  end

end 
