require 'net/http'
require 'json'
require 'io/console' 

correct = false
answer = nil
questions = [
    ["How many bigmacs can you buy with 1 bitcoin?", 5.5],
    ["How many 2004 Holden Commodores can you buy with 1 btc?", 4500],
    ["How many pets goats could you buy with 1 bitcoin?", 180],
    ["How many packets of Tim Tams could you buy with 1 bitcoin", 3.65],
    ["How many XXXXX drops could you get with 1 bitcoin", 000]
]



def key_to_continue                                                                                                           
    print "press any key to start!"                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r"                                                                                                             
end 

def self.blockchain
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

# Logo will go here to replace the welcome message

system("clear")
puts "Bitcoin to: ?"
key_to_continue


