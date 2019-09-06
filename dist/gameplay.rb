require_relative './methods'

# start of gameplay 
def gameplay
    correct = false
    q_picker = rand(11)
    iteration = 7
   
# questions array - question, per unit cost, image relative path
    questions = [
    ["How many Big Macs can you currently buy with 1 bitcoin?".center($center)                         , 5.5     , "images/objects/big_mac_black.jpg"],   
    ["How many 2004 Holden Commodores can you currently buy with 1 bitcoin?".center($center)           , 4500    , "images/objects/commodore_black.jpg"],  
    ["How many pets goats could you currently buy with 1 bitcoin?".center($center)                     , 180     , "images/objects/goat_black.jpg"],
    ["How many packets of Tim Tams could you currently buy with 1 bitcoin?".center($center)            , 3.65    , "images/objects/timtam_black.jpg"],
    ["How many Iphone XRs could you currently buy with 1 bitcoin?".center($center)                     , 1299    , "images/objects/iphone_black.jpg"],
    ["How many months of Netflix basic could you get with 1 bitcoin?".center($center)                  , 9.99    , "images/objects/netflix_black.jpg"],
    ["How many footlong veggie delite subway sandwiches can you get with 1 bitcoin?".center($center)   , 8.95    , "images/objects/veggie_delite_black.jpg"],
    ["How many return economy trips from Sydney to Cairns can you buy with 1 bitcoin?".center($center) , 550     , "images/objects/plane_black.jpg"],
    ["How many 2 litre bottles of Solo can you get with 1 bitcoin?".center($center)                    , 2.5     , "images/objects/solo_black.jpg"],
    ["How many Caramello Koalas can you buy for 1 bitcoin?".center($center)                            , 0.75    , "images/objects/koala_black.jpg"],
    ["How many Hoyts movie tickets can you buy with 1 bitcoin?".center($center)                        , 20      , "images/objects/hoyts_black.jpg"],   #10
    ["How many Nintendo Switches can you currently buy with 1 bitcoin?".center($center)                , 399     , "images/objects/switch_black.jpg"]
    ]

# object image print
    system("clear")
    puts "\n"
    Catpix::print_image questions[q_picker][2],
        :limit_x => 0.3,
        :limit_y => 0,
        :center_x => true,
        :center_y => false,
        :bg => "black",
        :bg_fill => false,
        :resolution => "high"

# Start of game logic
    while !correct
        number_of_items = ((blockchain.to_i)/questions[q_picker][1]).round
        
        if iteration == 0
            picture_you_lose
            puts "You have no more guesses left".center($center)
            puts "The correct answer was #{number_of_items}.".center($center)
            puts "\n"
            puts "Your current score is: #{$score}".center($center)
            puts "\n"
            play_again
        else
            puts
        end
            puts "\n" *2
            puts questions[q_picker][0]
            puts "\n"
            answer_char_check = gets
            answer = answer_char_check.to_i
            iteration -=1
                
# Start of answer checking/error handling logic
        if answer_char_check.count("a-zA-Z\~!@#$%^&*(){}[]|\`\,\.\;\''/") > 0
            system("clear")
            puts "\n"
            picture_grumpy_face
            puts "That is not a number!".colorize(:light_red).center($center+15)
            puts "\n"
            puts "You have #{iteration} guesses left.".center($center)
            puts "\n" *2
            key_to_continue
            system("clear")
            
# object image                 
            Catpix::print_image questions[q_picker][2],
                :limit_x => 0.3,
                :limit_y => 0,
                :center_x => true,
                :center_y => false,
                :bg => "black",
                :bg_fill => false,
                :resolution => "high"

# developer object skip
            elsif answer == 713 
                break
# way too low
            elsif (answer+100).to_i < number_of_items 
                picture_meter_very_low
                puts ("#{answer}"+" is way too low! Try again!").center($center)
                puts "\n"
                puts "You have #{iteration} guesses left!".center($center)
                puts "\n"
# too low
            elsif answer < number_of_items 
                picture_meter_low
                puts ("#{answer}"+" is too low! Try again!").center($center)
                puts "\n"
                puts "You have #{iteration} guesses left!".center($center)
                puts "\n"
# way too high
            elsif (answer-100).to_i > number_of_items 
                picture_meter_very_high
                puts ("#{answer}"+" is way too high! Try again!").center($center)
                puts "\n"
                puts "You have #{iteration} guesses left!".center($center)
# too high
            elsif answer > number_of_items 
                picture_meter_high
                puts ("#{answer}"+" is too high! Try again!").center($center)
                puts "\n"
                puts "You have #{iteration} guesses left!".center($center)
                puts "\n"
# correct guess
            elsif answer == number_of_items 
                $score += 1
                picture_you_win
                puts "You got it right!!".center($center)
                puts "Your current score is: #{$score}".center($center)
                puts "\n"
                correct = true
            else
                puts "That's not a number, try again!".center($center)
            end
        end
        play_again
end