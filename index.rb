require 'net/http'
require 'json'
require 'io/console' 
require 'catpix'
require 'colorize'
require_relative './gameplay'
require_relative './methods'

system("clear")

if ARGV[0] == "help"
    help_info
elsif ARGV[0] =="Canada" or ARGV[0] =="canada"
    canada
end
ARGV.clear

picture_logo
key_to_continue
gameplay