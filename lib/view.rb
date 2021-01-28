require 'pry'

class View
  
  def initialize
  end

  def create_gossip
    puts "quel est ton nom ?"
    print ">> "
    author = gets.chomp
    puts "quel est ton gossip ?"
    print ">> "
    content = gets.chomp
    return params = {author: author, content: content}
  end

end