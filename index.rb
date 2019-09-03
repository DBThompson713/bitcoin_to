require 'net/http'
require 'json'
require 'io/console' 

correct = false
q_picker = rand(5)
answer = nil
correct = false
questions = [
    ["How many bigmacs can you buy with 1 bitcoin?", 5.5],
    ["How many 2004 Holden Commodores can you buy with 1 btc?", 4500],
    ["How many pets goats could you buy with 1 bitcoin?", 180],
    ["How many packets of Tim Tams could you buy with 1 bitcoin", 3.65],
    ["How many XXXXX drops could you get with 1 bitcoin", 3.99 ]
]



def key_to_continue                                                                                                           
    print "press any key to start!"                                                                                                    
    STDIN.getch                                                                                                              
    print "            \r"                                                                                                             
end 

def blockchain
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

# Logo will go here to replace the welcome message

system("clear")
puts "Bitcoin to: ?"
key_to_continue


while !correct
    system("clear")
    number_of_items = ((blockchain.to_i)/questions[q_picker][1]).round
    p questions[q_picker][0]
    puts "\n"
    answer = gets.to_i
    puts number_of_items
    # puts answer
    if answer < number_of_items
        puts "too low! Try again!"
        puts "\n"
        next
    elsif answer > number_of_items
        puts "too high! Try again"
        puts "\n"

    elsif answer == number_of_items
        puts "Wow thats right!"
        correct = true
    else
       puts "That's not a number, try again!" 
    end
    key_to_continue
end




