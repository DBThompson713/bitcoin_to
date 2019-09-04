require_relative './methods'

$score = 0

def gameplay
    correct = false
    q_picker = rand(8)
    iteration = 7
   
# questions array - question, per unit cost, image relative path
    questions = [
    ["How many Big Macs can you currently buy with 1 bitcoin?".center(185)                        , 5.5     , "images/objects/big_mac.jpg"],
    ["How many 2004 Holden Commodores can you currently buy with 1 bitcoin?".center(185)          , 4500    , "images/objects/commodore_black.jpg"],
    ["How many pets goats could you currently buy with 1 bitcoin?".center(185)                    , 180     , "images/objects/goat_black.jpg"],
    ["How many packets of Tim Tams could you currently buy with 1 bitcoin".center(185)            , 3.65    , "images/objects/timtam.jpg"],
    ["How many Iphone XRs could you currently buy with 1 bitcoin".center(187)                     , 1299    , "images/objects/iphone_black.jpg"],
    ["How many months of Netflix basic could you get with 1 bitcoin".center(187)                  , 9.99    , "images/objects/netflix_proper.jpg"],
    ["How many footlong veggie delite subway sandwiches can you get with 1 bitcoin".center(185)   , 8.95    , "images/objects/veggie_delite_black.jpg"],
    ["How many Nintendo Switches can you currently buy with 1 bitcoin".center(188)                , 399     , "images/objects/switch_black.jpg"]
    ]

# image print
    system("clear")
    # image = questions[q_picker][2]
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

        puts "\n" *2
        puts questions[q_picker][0]
        puts "\n"
        answer = gets.to_i
        iteration -=1

# Start of answer checking logic
        if iteration ==0
            picture_you_lose

            puts "You have no more guesses left".center(190)
            puts "The correct answer was #{number_of_items}.".center(190)
            puts "\n"
            puts "Your current score is: #{$score}".center(190)
            puts "\n"
            play_again

        elsif answer == 713
            break
        elsif (answer+200) < number_of_items # way too low
            picture_meter_very_low
            puts ("#{answer}"+" is way too low!".colorize(:light_red) + " Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"

        elsif answer < number_of_items # too low
            picture_meter_low
            puts ("#{answer}"+" is too low!".colorize(:light_red) + " Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"

        elsif (answer-200) > number_of_items # way too high
            picture_meter_very_high
            puts ("#{answer}"+" is way too high!".colorize(:light_red) +" Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
        
        elsif answer > number_of_items # too high
            picture_meter_high
            puts ("#{answer}"+" is too high!".colorize(:light_red) +" Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"

        elsif answer == number_of_items #correct guess
            $score += 1
            picture_you_win
            puts "You got it right!!".center(190)
            puts "Your current score is: #{$score}".center(190)
            puts "\n"
            correct = true

        else
        puts "That's not a number, try again!".center(190)
        end
    end
    play_again
end