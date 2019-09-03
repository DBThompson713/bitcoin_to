require 'net/http'
require 'json'
require 'io/console' 

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

def play_again
    puts "Would you like to play again?"
    puts "       yes    or     no      "
    play_again_answer = gets.chomp
    
    if play_again_answer == "yes"
        gameplay
    elsif play_again_answer == "no"
        exit
    else 
        play_again
    end
end


def gameplay
    correct = false
    q_picker = rand(5)
    iteration = 5
    questions = [
    ["How many bigmacs can you buy with 1 bitcoin?", 5.5],
    ["How many 2004 Holden Commodores can you buy with 1 btc?", 4500],
    ["How many pets goats could you buy with 1 bitcoin?", 180],
    ["How many packets of Tim Tams could you buy with 1 bitcoin", 3.65],
    ["How many XXXXX drops could you get with 1 bitcoin", 3.99 ]
    ]

    system("clear")

    while !correct
        number_of_items = ((blockchain.to_i)/questions[q_picker][1]).round
        p questions[q_picker][0]
        puts "\n"
        answer = gets.to_i
        iteration -=1
        puts number_of_items
        puts iteration
        # puts answer
        if iteration ==0
            puts "You have no more guesses left"
            play_again
        elsif answer < number_of_items
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
    end
end


# Logo will go here to replace the welcome message
system("clear")
puts "Bitcoin to: ?"
key_to_continue

gameplay

play_again