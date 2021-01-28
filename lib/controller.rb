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

  def show_gossip_list
    
  end

  def delete_gossip
    # => Une fois l'action effectuée (via le model), la méthode devra renvoyer vers la view.
  end

end