require 'net/http'
require 'json'
require 'io/console' 
require 'catpix'
require 'colorize'
require_relative './gameplay.rb'
require_relative './methods.rb'

system("clear")

Catpix::print_image "./images/bitcoin_to_logo2.jpg",
  :limit_x => 0.75,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"

key_to_continue
gameplay
