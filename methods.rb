
# press any key to continue
def key_to_continue                                                                                                           
    print "Press any key to start!".center(175)                                                                                                 
    STDIN.getch                                                                                                              
    print "            \r"                                                                                                             
end 

def blockchain
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

def play_again
    puts "Would you like to play again?".center(192)     
    puts "       Yes    or     No      ".center(192)     
    play_again_answer = gets.chomp.downcase
    
    if play_again_answer == "yes"
        gameplay
        
    elsif play_again_answer == "no"
        system("clear")
        puts "\n" *20
        puts "Your final score is #{$score}".center(175)
        STDIN.getch 
        system("clear")
        exit
    else 
        puts "I didn't understand that.".center(190).colorize(:light_red)
        puts "\n"
        play_again
    end
end

def spacing 
    puts "\n" *3
end
