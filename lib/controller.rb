require 'pry'
require 'gossips'
require 'view'

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

#binding.pry