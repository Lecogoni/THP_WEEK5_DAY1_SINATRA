require 'pry'
require 'json'
require 'csv'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
    @my_gossip = [author, content]
    
    #self.save
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << @my_gossip
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(params)
    para = (params.to_i - 1)
    gossips = Gossip.all
    gossips.each_with_index do |gossip, idx|
      if para == idx 
        return gossip
      end
    end
  end

  def self.update(params)
    index = (params["id"].to_i - 1)
    @gossip = Gossip.find(index)
    @gossip.author = params[:gossip_author]
    @gossip.content = params[:gossip_content]
    #Gossip.new(@gossip.author, @gossip.content).save

    #=> ici le new.save marche aussi / mais on  ne fait pas la sauvegarde en db alors que la modif est bien faite

  end

  
end


