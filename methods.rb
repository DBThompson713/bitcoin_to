def key_to_continue # press any key to start                                                                                                       
    print "Press any key to continue!".center(190)                                                                                                 
    STDIN.getch                                                                                                    
    print "            \r"                                                                                                             
end 

def blockchain # gets the current bitcoin value
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

def play_again # asks if the user would like to play again
    puts "Would you like to play again?".center(192)     
    puts "      Yes    or     No       ".center(192)     
    play_again_answer = gets.chomp.downcase
    
    if play_again_answer == "yes"
        gameplay  

    elsif play_again_answer == "no"
        final_score

    else 
        puts "I didn't understand that.".center(192).colorize(:light_red)
        puts "\n"
        play_again
    end
end

def final_score # called when the player quits the game
    system("clear")
    puts "\n" *20
    puts "Your final score is #{$score}".center(175)
    STDIN.getch 
    system("clear")
    exit
end

# Pictures

def picture_logo
    Catpix::print_image "./images/one_bitcoin_logo_black.jpg",
        :limit_x => 0.65,
        :limit_y => 0,
        :center_x => true,
        :center_y => true,
        :bg => "white",
        :bg_fill => false,
        :resolution => "high"
end

def picture_you_lose
    system("clear")
    puts "\n"
    Catpix::print_image "./images/bitcoin_fail_black.jpg",
        :limit_x => 0.4,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
end

def picture_you_win
    system("clear")
    puts "\n"
    Catpix::print_image "./images/btc_thumb_black.jpg",
        :limit_x => 0.3,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => true,
        :resolution => "high"
    puts "\n"
end

def picture_meter_very_low
    system("clear")
    puts "\n"
    Catpix::print_image "./images/meter/meter_very_low.jpg",
        :limit_x => 0.4,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"           
end

def picture_meter_low
    system("clear")
    puts "\n"
    Catpix::print_image "./images/meter/meter_low.jpg",
        :limit_x => 0.4,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"
end

def picture_meter_high
    system("clear")
    puts "\n"
    Catpix::print_image "./images/meter/meter_high.jpg",
        :limit_x => 0.4,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"
end

def picture_meter_very_high
    system("clear")
    puts "\n"
    Catpix::print_image "./images/meter/meter_very_high.jpg",
        :limit_x => 0.4,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"
end

def picture_grumpy_face
    system("clear")
    puts "\n"
    Catpix::print_image "./images/grumpy_face_black.jpg",
        :limit_x => 0.3,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"
end