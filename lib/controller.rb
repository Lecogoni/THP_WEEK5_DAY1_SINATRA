
# require 'bundler'
# Bundler.require

require 'pry'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts params
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

 get '/hello/:id' do
    puts "Hello ton id est #{params['id']}!"
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end

  get '/edit/:id' do
    puts "le edit id est #{params['id']}!"
    puts idx
    erb :edit, locals: {gossip: Gossip.find(params['id'])}
  end

  post '/edit/' do
    puts "le edit id V2 #{params['id']}!"
    puts "hash params : #{params}"
    puts "new gossip_author : #{params["gossip_author"]}"
    puts "new content : #{params["gossip_content"]}"
    puts params
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end 

  #run! if app_file == $0
end

#binding.pry


=begin
  
    
  
=end