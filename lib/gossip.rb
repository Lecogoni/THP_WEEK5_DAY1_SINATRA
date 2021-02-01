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

  def update(params)
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    
    all_gossips.each_with_idx do |gossip, idx|
      # => idx = keep index
      # modifie l'index array
    end
    
  end

  
end





=begin
  
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

  def self.all
    all_gossips = CSV.parse(File.read("db/gossip.csv"), headers: false)
  end


  def self.delete(params) # => delete selon l'index
    file = CSV.read(("db/gossip.csv"), headers: false)
    file.delete_at(params - 1)
  
    CSV.open(("db/gossip.csv"), 'w+') do |csv|
      file.each_with_index do |row, idx|
        csv << file[idx]
      end
    end

  end

  
=end