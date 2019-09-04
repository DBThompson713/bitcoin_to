def gameplay
    correct = false
    q_picker = rand(5)
    iteration = 7
    questions = [
    ["How many Big Macs can you currently buy with 1 bitcoin?".center(182)     , 5.5,"images/big_mac.jpg"],
    ["How many 2004 Holden Commodores can you currently buy with 1 bitcoin?".center(175)     , 4500,"images/commodore.jpg"],
    ["How many pets goats could you currently buy with 1 bitcoin?".center(175)     , 180, "images/new_goat.jpg"],
    ["How many packets of Tim Tams could you currently buy with 1 bitcoin".center(185)     , 3.65, "images/timtam.jpg"],
    ["How many Nintendo Switches can you currently buy with 1 bitcoin".center(175)     , 399, "images/switch_prop.jpg" ]
    ]

    system("clear")
    image = questions[q_picker][2]

        Catpix::print_image image,
            :limit_x => 0.3,
            :limit_y => 0,
            :center_x => true,
            :center_y => false,
            :bg => "black",
            :bg_fill => false,
            :resolution => "high"

    while !correct
        number_of_items = ((blockchain.to_i)/questions[q_picker][1]).round
    
        puts "\n"
        
        

        p questions[q_picker][0]
        puts "\n"
        answer = gets.to_i
        iteration -=1
        #  puts number_of_items
        if iteration ==0
            system("clear")
            spacing
            puts "You have no more guesses left".center(175)
            puts " the correct answer was #{number_of_items}".center(175)
            puts "\n"
            play_again
        elsif answer < number_of_items
            system("clear")
            Catpix::print_image "./images/meter_low.png",
            :limit_x => 0.4,
            :limit_y => 0,
            :center_x => true,
            :center_y => false,
            :bg => "black",
            :bg_fill => false,
            :resolution => "high"
            puts "\n"
            puts "#{answer} is too low! Try again!".center(175)
            puts "you have #{iteration} guesses left!".center(175)
            puts "\n"
        elsif answer > number_of_items
            system("clear")
            Catpix::print_image "./images/meter_high.png",
            :limit_x => 0.4,
            :limit_y => 0,
            :center_x => true,
            :center_y => false,
            :bg => "black",
            :bg_fill => false,
            :resolution => "high"

            puts "\n"
            puts "#{answer} is too high! Try again".center(175)
            puts "you have #{iteration} guesses left!".center(175)
            puts "\n"
        elsif answer == number_of_items
            system("clear")

            Catpix::print_image "./images/btc_thumb.jpg",
            :limit_x => 0.3,
            :limit_y => 0,
            :center_x => true,
            :center_y => false,
            :bg => "black",
            :bg_fill => true,
            :resolution => "high"

            spacing
            puts "You got it right!!".center(175)
            puts "\n"
            correct = true
        else
        puts "That's not a number, try again!".center(175)
        end
    end
    play_again
end