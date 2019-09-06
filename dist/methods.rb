# help file

# global variables
$center = Rake.application.terminal_width
$score = 0

# help file ARGV
def help_info
    system("clear")
    puts "\n" * 9
    puts "1 bitcoin".center($center)
    puts "A frustrating bitcoin game".center($center).colorize(:light_red)
    puts "\n" *3
    
    puts "This game provides you with a random thing, such as a car or a chocolate bar, then asks you".center($center)
    puts "to guess how many of that thing you can purchase for 1 bitcoin. Sounds simple right?".center($center)
    puts "\n"
    puts "As an added wrinkle, your purchasing power is directly tied to the current value of bitcoin.".center($center)
    puts "As the value of bitcoin changes, so does the correct answer.".center($center)
    puts "\n" *2
    puts "PS. This game is completely satire. 1 Bitcoin is meant to poke fun, not make a statement.".center($center)
    puts "\n" *2
    puts "-----------------------------------------------------------------".center($center).colorize(:yellow)
    puts "\n" *2
    puts "To play the game:".center($center)
    puts "\n"
    puts "Pick a number.".center($center)
    puts "\n"
    puts "Not a letter. Not an emoji. Not your nose.".center($center).colorize(:light_red)
    puts "Only a number".center($center)
    puts "\n"*2
    puts "If you're correct, you get a thumbs up! If you're too low or too high, the fail meter will let you know.".center($center)
    puts "the text will be automatically centered once the game runs. However, if you change the terminal size while".center($center)
    puts "the text will no longer be center aligned".center($center)
    puts "\n"*3
    key_to_continue
end

 
# gameplay methods

def key_to_continue                                                            # press any key to start                                                                                                       
    print "Press any key to continue!".center($center)                                                                                                 
    STDIN.getch                                                                                                    
    print "            \r"                                                                                                             
end 

def blockchain                                                                 # gets the current bitcoin value
    uri = URI('https://blockchain.info/ticker')
    json = JSON.parse(Net::HTTP.get(uri))
    json["AUD"]["last"]
end

def play_again                                                                 # asks if the user would like to play again
    puts "Would you like to play again?".center($center)     
    puts "      Yes    or     No       ".center($center)     
    play_again_answer = gets.chomp.downcase
    if play_again_answer == "yes"
        gameplay  
    elsif play_again_answer == "no"
        final_score
    else 
        puts "I didn't understand that.".center($center).colorize(:light_red)
        puts "\n"
        play_again
    end
end

def final_score                                                                 # Displays score when the player quits the game
    system("clear")
    puts "\n" *20
    puts "Your final score is #{$score}".center($center)
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