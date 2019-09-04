require 'net/http'
require 'json'
require 'io/console' 
require 'catpix'
require 'colorize'
require 'curses'
require_relative 'methods'
require_relative 'gameplay'

system("clear")

# Catpix::print_image "./images/big_mac.jpg",
#   :limit_x => 0.3,
#   :limit_y => 0,
#   :center_x => true,
#   :center_y => false,
#   :bg => "white",
#   :bg_fill => false,
#   :resolution => "high"

  
Catpix::print_image "./images/new_goat.jpg",
:limit_x => 0.5,
:limit_y => 0,
:center_x => true,
:center_y => false,
:bg => "white",
:bg_fill => false,
:resolution => "high"

Catpix::print_image "./images/commodore.jpg",
  :limit_x => 0.5,
  :limit_y => 0.8,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"
  
Catpix::print_image "./images/switch_prop.jpg",
:limit_x => 0.5,
:limit_y => 0.5,
:center_x => true,
:center_y => true,
:bg => "white",
:bg_fill => false,
:resolution => "high"

# Catpix::print_image "./images/bitcoin_to_logo2.jpg",
#   :limit_x => 0.75,
#   :limit_y => 0,
#   :center_x => true,
#   :center_y => true,
#   :bg => "white",
#   :bg_fill => false,
#   :resolution => "high"

 key_to_continue
 gameplay
 play_again


# Curses.init_screen
# begin
#   x = Curses.cols / 2  # We will center our text
#   y = Curses.lines / 3
#   Curses.setpos(y, x)  # Move the cursor to the center of the screen
#   Curses.addstr(gameplay)  # Display the text
#   Curses.refresh  # Refresh the screen
#   Curses.getch  # Waiting for a pressed key to exit
# ensure
#   Curses.close_screen
# end