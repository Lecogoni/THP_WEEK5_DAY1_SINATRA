require 'pry'

class View
  
  def initialize
  end

  def create_gossip
    puts "Tu as choisi de créer un gossip\n"
    puts "quel est ton nom ?"
    print ">> "
    author = gets.chomp
    puts "quel est ton gossip ?"
    print ">> "
    content = gets.chomp
    return params = {author: author, content: content}
  end

  def index_gossips(all_gossips)
    if all_gossips.length == 0
      puts " Aucun potin d'enregistré"
    else
      puts "voici la list des gossips : \n"
      all_gossips.each_with_index do |gossip, idx|
        puts "Gossip #{idx + 1}"
        puts "  - Author : #{gossip[0]}"
        puts "  - Content : #{gossip[1]}"
      end
    end
  end
  
  def delete_gossip(all_gossips)
    puts "\nvoici la list des gossips : \n\n"
    all_gossips.each_with_index do |gossip, idx|
      puts "Gossip #{idx + 1}"
      puts "  - Author : #{gossip[0]} - Content : #{gossip[1]}"
    end
    puts "\n Lequel souhaites tu effacer ? (tape son numéro)"
    print ">> "
    params = gets.chomp.to_i
  end

end