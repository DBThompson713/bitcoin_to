require 'net/http'
require 'json'
require 'io/console' 

correct = false
answer = nil

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