require 'pry'
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
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is 
positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

Data Structure:
Input : An integer representing MINUTES either positive negative or zero
Output: a string value simulating hours and minutes on a clock

Algorithim
  define the time of day method with a paramater for the change in minutes (DELTA_MINUTES)
  initiatilize a local varialble change_in_minutes = delta_minutes / MINUTES_PER_HOUR
  
  initialize a local variable called change in hours
    change_in_hours = change_in_minutes % HOURS_PER_DAY
 
 delta_minutes (change in Minutes = delta_minutes % MINUTES_PER_DAY
 initialize 2 local variables HOURS and MINUTES equal to the delta minutes invoking the divmod method, on the argument MINUTES_PER_HOUR
 
def time_of_day(minutes)
  change_in_minutes = minutes % 1440
  hours = change_in_minutes / 60
  minutes = change_in_minutes % 60
  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
puts time_of_day(1439) == "23:59"

After Midnight part 2
write two methods that each take a time of 24 hour format. return the number of minutes before and after midnight
both methods sould return an interger between 0 and 1439.

PEDAC
before_midnight and after_mightnight methods in relation to 1440 minutes in a day

input: a string in the 00:00 format
output: an integer between 0 and 1439

Need to convert the string to an integer value

Algorithim

before_midnight(string)
after_midnight(string)

initiatlie method defintion after_midnight(string)
  string is in 00:00 format and needs to be converted to 2 integers
  divmod?
  
 
  first_value = (string[0] + string[1]).to_i
  hour_minutes = first_value * 60
  minutes = (string[3] + string [4]).to_i
  
  first_value + second_value
end the method definition

before midnight and edge cases
initialize a method defintion before_midnight that takes a CLOCK parameter
  first_value = (string[0] + string[1]).to_i
  hour_minutes = first_value * 60
  minutes = (string[3] + string [4]).to_i
  
  first_value - second_value
  
  Edge case : 24?


def after_midnight(clock)
  hour = (clock[0] + clock[1]).to_i
  hour_minutes = hour * 60
  if hour_minutes == 1440
    hour_minutes = 0
  end

  minutes = (clock[3] + clock[4]).to_i
  hour_minutes + minutes
end

def before_midnight(clock)
  hour = (clock[0] + clock[1]).to_i
  hour_minutes = hour * 60
  if hour_minutes == 1440
    hour_minutes = 0
  end

  minutes = (clock[3] + clock[4]).to_i
  hour_minutes - minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0



#Letter Swap
Take a string of words separated by spaces and write a method that 
takes the first and last eltters of each word are swapped
each string contains nothing but words and spaces and each string contains wrods w/ at least 1 letter

Example - given

D:ata Strucutre
input: a string of words containing spaces between each word
output a string of words contains spaces between each word with the first and last letters swapped on each word

A:lgorithim
  deine the method SWAP that takes the parameter (STRING)
  turn a string into an array to be able to iterate over the words and .split method call
  swap the sapces between the first and last letter of each word (transforamtion) (/map method)
  for each item in the array swap the values in index[0] and index [-1]
  
def swap(string)
  array = string.split
  array.each do |word|
    first = word[0]
    last = word[-1]
    word[-1] = first
    word[0] = last
  end
  array.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

Clean Up the Words
Given a string that consists of all lowercase words and assorted non-alphanumeric characters
write a method that replaces the non-alphanumeric characters with spaces, only have 1 space if multiple
non-alphanumeric characters are in a row, the result has only 1 space at a time

Example: below
Data Structure
Input: a string containing lowercase alphanumeric characters, nonalphanumeric charcters and spaces
Output: a space to replace a series of non-anc's and the aplhanumerica characters

A:logirithim
  There has to be a way to do the alphabet a..z?
  use .gsub to substitute for the non-alphanumeric characters

  %w(a..z),include? (string)



def cleanup(string)
  string.gsub!(/[-'+*&?]/, ' ')
  string.squeeze(' ')
end
puts cleanup("---what's my +*& line?") == ' what s my line '


Try writing it without regex
Algorithim
Set a constant for an array objext of all letters
define the method definition name
  
  Extract the characters from the string that are the samea s what can be found in ALPHABET
  if the character IS found in the ALPHABET
    call the shovel operator on the character and push it into the clean chars array
  else 
    push in a space unless the last thing put in the array was a space
  end the conditional
  
  join the characters in the clean_chars array
end the method definition


ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_chars = []
  
  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  
  clean_chars.join
end      
  
puts cleanup("---what's my +*& line?") == ' what s my line '

Letter Counter Part I
Write a method that takes a sring with one or more space separated words
and returns a hash that thsows the nuber of words of differet sizes
Words are a string of charactes that dont include a space

Input - a String of words separated by a space
Output a Hasah containing keys that are integer values that are the nuumber of checters in a word and 
values that are integers that reference the number of words in the string that have those many letters

Algorithim 
  initialize a method defintion holding the parameter STRING
    initialize a new hash called count
    
    initialize a local variable array = convert the string to an array with the .split method
    
    count[]
    value

def word_sizes(string)
  count = Hash.new(0)
  
  string.split.each do |word|
    count[word.size] += 1
  end
  
  count
end
  

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

Letter Counter Part 2
odify Word_sizes method to exclude non-letters when determinins word size
it's is 3 not 4

Data
Input is a string value containing a variety of characters
Output a hash that counts the values

Algoritihim 
  remove non alphanumeric charactes from the count
  


def word_sizes(string)
  count = Hash.new(0)
  array = string.split
  
  array = array.each do |word|
    word = word.gsub(/[^A-Za-z]/, '') # ^A-Za-z does NOT match A-Z and a-z, replace it with '' <= nothing, no space etc...
    count[word.size] += 1
 end
 
  count
end
  
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

Alphabetical Numbers
Write a method that takes an array of Integers between 0-19 and returns an Array
of those Integers sorted based on the English words for that number

zero, one, two, there, four, five, six, seven, eight nine, ten, eleven, twelve, thirteen, fourteen,
fifteen, sixteen, seventeen, eighteen, nineteen

Data Structure: input : will have th be a hash of keys/values 
keys will be the integer and values will be the string
Output : an array of integer objects based on their alphabetical spelling

Algorithim
  initiate a method definition definted alphabetic_number_sort that takes paramenter (numbers) an argument ((0..19).to_a)
  define a constant that is the spelling of each integer in string format, these strings are
  already in the correct index value to refer to them in a block as an index
    initilize the argument and call a method and a block to iterate over the ARRAY
      sort the values (string objects) based on their ordinal value
      
      

=end
NUMBERS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by do |num| 
    NUMBERS[num] # this is the syntax for what the argument is passing in
  end
  
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

