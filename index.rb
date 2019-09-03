require 'net/http'
require 'json'
require 'io/console' 
require 'catpix'

def key_to_continue                                                                                                           
    print "press any key to start!".center(175)                                                                                                 
    STDIN.getch                                                                                                              
    print "            \r"                                                                                                             
end 

def blockchain
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

def play_again
    puts "Would you like to play again?".center(175)     
    puts "       yes    or     no      ".center(175)     
    play_again_answer = gets.chomp.downcase
    
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
    ["How many bigmacs can you buy with 1 bitcoin?".center(175)     , 5.5],
    ["How many 2004 Holden Commodores can you buy with 1 btc?".center(175)     , 4500],
    ["How many pets goats could you buy with 1 bitcoin?".center(175)     , 180],
    ["How many packets of Tim Tams could you buy with 1 bitcoin".center(175)     , 3.65],
    ["How many Nintendo Switches can you buy with 1 bitcoin".center(175)     , 399 ]
    ]

    system("clear")

    while !correct
        number_of_items = ((blockchain.to_i)/questions[q_picker][1]).round
        puts "\n"
        puts "\n"
        p questions[q_picker][0]
        puts "\n"
        answer = gets.to_i
        iteration -=1
        puts "you have #{iteration} guesses left!".center(175)
        # puts answer
        if iteration ==0
            puts "\n"
            puts "\n"
            puts "You have no more guesses left".center(175)
            puts " the correct answer was #{number_of_items}".center(175)
            puts "\n"
            play_again
        elsif answer < number_of_items
            puts "too low! Try again!".center(175)
            puts "\n"
            next
        elsif answer > number_of_items
            puts "too high! Try again".center(175)
            puts "\n"

        elsif answer == number_of_items
            puts "Wow thats right!".center(175)
            correct = true
            break
        else
        puts "That's not a number, try again!".center(175)
        end
    end
end


# Logo will go here to replace the welcome message
system("clear")


Catpix::print_image "./images/bitcoin_to_logo2.jpg",
  :limit_x => 0.75,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"

  key_to_continue


  gameplay

play_again