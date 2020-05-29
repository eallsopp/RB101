
#ASCII String Value
# Write a method that detemines the ASCII string valueof a string that is apssed in an argument
  # must use string.ord to determine ASCII value of a character
  #ASCII is the sum of every character in a string
=begin
def ascii_value(string)
  string = string.split('')
  string.map! do |num|
    num.ord
  end
  string.sum
end


puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

#After Midnight Part 1
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
 
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

=begin
#Swap

def swap_characters(word)

end

def swap(string)
  
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# cleanup

ALPHABET = ('a'..'z').to_a

def cleanup(phrase)

end

puts cleanup("---what's my +*& line?") == ' what s my line '
=end