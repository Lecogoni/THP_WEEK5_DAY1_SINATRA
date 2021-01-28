require 'pry'
require 'json'
require 'csv'

class Gossip

  #attr_accessor :my_gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
    @my_gossip = [author, content]
    
    self.save_as_csv
    self.save_as_json
  end

  def save_as_csv
    CSV.open("db/gossip.csv", "a+") do |csv|
        csv << @my_gossip
    end
  end

  def save_as_json
    File.open("db/gossip.json", "a+") do |f|
      f.write(JSON.pretty_generate(@my_gossip))
    end
  end
  
end

