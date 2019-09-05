# help file

def help_info
    system("clear")
    puts "\n" * 9
    puts "1 bitcoin".center(190)
    puts "A frutstrating bitcoin game".center(190).colorize(:light_red)
    puts "\n" *3
    
    puts "This game provides you with a random thing, such as a car or a chocolate bar, then asks you".center(190)
    puts "to guess how many of that thing you can purchase for 1 bitcoin. Sounds simple right?".center(190)
    puts "\n"
    puts "As an added wrinkle, your purchasing power is directly tied to the current value of bitcoin.".center(190)
    puts "As the value of bitcoin changes, so does the correct answer.".center(190)
    puts "\n" *2
    puts "-----------------------------------------------------------------".center(190).colorize(:light_grey)
    puts "\n" *2
    puts "To play the game:".center(190)
    puts "\n"
    puts "Pick a number.".center(190)
    puts "\n"
    puts "Not a letter. Not an emoji. Not your nose.".center(190).colorize(:light_red)
    puts "Only a number".center(190)
    puts "\n"*2
    puts "If you're correct, you get a thumbs up! If you're too low or too high, the fail meter will let you know".center(190)
    puts "\n"*10
    key_to_continue
end

 
# gameplay methods

def key_to_continue                                                            # press any key to start                                                                                                       
    print "Press any key to continue!".center(190)                                                                                                 
    STDIN.getch                                                                                                    
    print "            \r"                                                                                                             
end 

def blockchain                                                                 # gets the current bitcoin value
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

def play_again                                                                 # asks if the user would like to play again
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

def final_score                                                                 # Displays score when the player quits the game
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

def canada
    Catpix::print_image "./images/canada_flag.jpg",
        :limit_x => 0.75,
        :limit_y => 0.95,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"
    puts "\n"

    key_to_continue
end