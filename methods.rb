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

def spacing 
    puts "\n" *3
end