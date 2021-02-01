
# require 'bundler'
# Bundler.require

require 'pry'


#$:.unshift File.expand_path("./../lib", __FILE__)

#require 'lib/gossips'
#require 'view'

class Controller
  
  attr_accessor :gossip

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    @gossip = Gossip.new(params[:author], params[:content])
    #@gossip.save_as_csv => cela fonctionne aussi
  end

  def index_gossips
    @view.index_gossips(Gossip.all) #=> Gossip.all method de Gossip retourne 2D array envoyé a la view
  end

  def delete_gossip
    params = @view.delete_gossip(Gossip.all)
    Gossip.delete(params)
    self.index_gossips
  end

end


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
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
    puts params
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

 get '/hello/:id' do
    puts "Hello ton id est #{params['id']}!"
    #gossip = Gossip.find(params['id'])
    erb :show, locals: {gossip: Gossip.find(params['id'])}

    #=> faut allezr faire un find avec le params !!
  end

  #run! if app_file == $0
end

#binding.pry


=begin
  

  
=end