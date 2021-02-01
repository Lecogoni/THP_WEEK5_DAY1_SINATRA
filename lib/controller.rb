require 'bundler'
Bundler.require

require 'pry'

class ApplicationController < Sinatra::Base

  # index
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  # route vers new gossip
  get '/gossips/new/' do
    erb :new_gossip
  end

  # post new gossip
  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts params
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  # route vers single gossip
  get '/hello/:id' do
    puts "Hello ton id est #{params['id']}!"
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end

  # route vers update du gossip
  get '/edit/:id' do
    puts "le edit id est #{params['id']}!"
    erb :edit
  end

  post '/edit/:id' do
    puts params['id']
    # => on recup bien params (tous id det update)
    # => {"gossip_author"=>"plus", "gossip_content"=>"mieux", "id"=>"15"}     
    update_gossip = Gossip.update(params)
    binding.pry


    redirect '/'
  end 

  #run! if app_file == $0
end
