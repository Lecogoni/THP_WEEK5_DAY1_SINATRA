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

  # => .qqch = Method de class qui s'appel par NomClass.all 
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

end


=begin




  

 #all_gossips = Gossip.all
    #puts all_gossips[params - 1]
    #CSV.open ("db/gossip.csv", "r+", headers: false) do |file| #, encoding: "UTF-8", headers: false
      CSV.foreach ("db/gossip.csv", encoding: "UTF-8", headers: false) do |row|
        puts row
        #t.delete
      end
    #end


    #################


       # @csv.each_with_index do |row, idx|
    #   # puts row[5]
    #   if (params - 1) == idx
    #     puts row#.delete
    #   else
    #     print @csv.class
    #   end
    # end
  




# -------

table = CSV.table(@csvfile)

table.delete_if do |row|
  row[:foo] == 'true'
end




  # CSV.open("db/gossip.csv", "a+") do |csv|
    #   csv << @my_gossip
    # end
   
    # File.open(("db/gossip.csv"), 'w') do |f|
    #   f.write(@csv.to_csv)
    # end


=end
