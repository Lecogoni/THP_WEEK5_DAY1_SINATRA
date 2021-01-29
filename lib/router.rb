require 'controller'

class Router
  
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform 
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true

      puts "\nTu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Afficher les gossips"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i 

      case params 
      when 1
        @controller.create_gossip

      when 2
        @controller.index_gossips

      when 3
        @controller.delete_gossip

      when 4
        puts "À bientôt !"
        break 

      else
        puts "Ce choix n'existe pas, merci de ressayer" 

      end
    end
  end

end