$score = 0

def gameplay
    correct = false
    q_picker = rand(8)
    iteration = 7
   
# questions array - question, per unit cost, image relative path
    questions = [
    ["How many Big Macs can you currently buy with 1 bitcoin?".center(185)     , 5.5,"images/objects/big_mac.jpg"],
    ["How many 2004 Holden Commodores can you currently buy with 1 bitcoin?".center(185)     , 4500,"images/objects/commodore.jpg"],
    ["How many pets goats could you currently buy with 1 bitcoin?".center(185)     , 180, "images/objects/new_goat.jpg"],
    ["How many packets of Tim Tams could you currently buy with 1 bitcoin".center(185)     , 3.65, "images/objects/timtam.jpg"],
    ["How many Iphone XRs could you currently buy with 1 bitcoin".center(187)     , 1299, "images/objects/iphone.jpg"],
    ["How many months of Netflix basic could you get with 1 bitcoin".center(187)     , 9.99, "images/objects/netflix_proper.jpg"],
    ["How many footlong veggie delite subway sandwiches can you get with 1 bitcoin".center(185)     , 8.95, "images/objects/veggie_delite.jpg"],
    ["How many Nintendo Switches can you currently buy with 1 bitcoin".center(190)     , 399, "images/objects/switch_prop.jpg" ]
    ]

# image print
    system("clear")
    image = questions[q_picker][2]
        puts "\n"
        Catpix::print_image image,
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


        p questions[q_picker][0]
        puts "\n"
        answer = gets.to_i
        iteration -=1

#  Start of answer checking logic
        if iteration ==0
            system("clear")
            puts "\n"
            Catpix::print_image "./images/bitcoin_fail.jpg",
                :limit_x => 0.4,
                :limit_y => 0,
                :center_x => true,
                :center_y => false,
                :bg => "black",
                :bg_fill => false,
                :resolution => "high"

            # puts "\n"
            puts "You have no more guesses left".center(190)
            puts "The correct answer was #{number_of_items}.".center(190)
            puts "\n"
            puts "Your current score is: #{$score}".center(190)
            puts "\n"
            play_again
        elsif (answer+200) < number_of_items
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
            puts ("#{answer}"+" is way too low!".colorize(:light_red) + " Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"
        elsif answer < number_of_items
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
            puts ("#{answer}"+" is too low!".colorize(:light_red) + " Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"
        elsif (answer-200) > number_of_items
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
            puts ("#{answer}"+" is way too high!".colorize(:light_red) +" Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"
        elsif answer > number_of_items
            system("clear")

            Catpix::print_image "./images/meter/meter_high.jpg",
                :limit_x => 0.4,
                :limit_y => 0,
                :center_x => true,
                :center_y => false,
                :bg => "black",
                :bg_fill => false,
                :resolution => "high"

            puts "\n"
            puts ("#{answer}"+" is too high!".colorize(:light_red) +" Try again!").center(205)
            puts "You have #{iteration} guesses left!".center(190)
            puts "\n"
        elsif answer == number_of_items
            $score += 1
            system("clear")
            puts "\n"

            Catpix::print_image "./images/btc_thumb.jpg",
                :limit_x => 0.3,
                :limit_y => 0,
                :center_x => true,
                :center_y => false,
                :bg => "black",
                :bg_fill => true,
                :resolution => "high"

            spacing
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