require 'pry'
=begin
Combine Two Lists

Write a method that combines 2 arrays passed in as arguments and returns a new array
that contains all elements from both Array arguments, with the elemtns taken in
alternation
You may assume both are not empty and they hav the same number of elements

I can initiate a new array object
initate a counter = 0

initiate a loop

exit the loop when counter is == size of the array2
  then take the index values of the arguments that get passed in, as the primary objects
  via a loop


def interleave(array1, array2)
  new_array = []
  counter = 0
  
  loop do
    new_array << array1[counter]
    new_array << array2[counter]
    counter += 1
    break if counter == array1.size
  end

new_array  
end
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

FURTHER EXPLORATION
def interleave(array1, array2)
  array1.zip(array2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

Lettercase counter
Write a method that takes a sring, and then retunrs a hash that contains 3 entries
lowercase letters, uppercase letters and neither

initiate the method definition for letter_case_count

def letter_case_count(string)
  count = {
  
  lowercase: string.count('a-z'),
  uppercase: string.count('A-Z'),
  neither: string.count('^a-zA-Z')
  
  }  
  count
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


Capitalize Words
Write a method that takes a single string argument and retunrs a new stringtha contains
the original value of the argument andcapitalizes every word while leaven the rest
lowercase

initialize the definition
  call .split on string in order to break the string into an array
  iterate over the array with .map in order to return a new array
  initialize the block with variable |word|
    
    iteration will call the method .capitalize on each word in the array
      if word[0] is a-z?
  end
  


def word_cap(string)

  array = string.split.map do |word|  #returned a new array, did not impact the original
    word.capitalize
  end
  
  array.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


Take a string as an argument and return a string that has the capitalization sqapped
do not use swapcase

I can split to a array
I can turnthe array to a hash each_with_index
I could make a hash to swap keys and values and values and keys
I can turn the hash to an array, and turn the array to a string.join(' ')

def swapcase(string)
  array = string.split('') # this will give an array of individual characters
  array.map! do |word|
    if word == word.capitalize
      word.downcase
    else
      word.upcase
    end
  end
  array.join('')
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


Staggered Caps
Write a method that takes a string as an argument and returns a new String that contains
the original value using a staggered capitalization scheme in which every other 
character is capitalized and remaining are lowercase, non-letter characters count as a 
character, when switching, but non-alphabetic characters should not change

According to exercises the even indexed characters are uppercase
while the odd indexed characters are lowecase

NEW STRING
Algorithim
initialize the method defintion with te parameter STRING
  convert the string to an array with .chars method
  then call .each_with_index and initialize a block
    within the block local variable letter and idx.
    idx is 0 or even, letter.capitalize!
    since it is transformation, I will initialize the block with map
      

def staggered_case(string)

  string.chars.map.with_index do |letter, idx|  # map.with_index can combine block calls
    idx.even? ? letter.upcase : letter.downcase
    end.join # this needs to be at the end of the block, since the new string is MAP
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

Staggered CAps Part 2
Modify the above to make it discount non-alphabetic charactes
if letter.to_i next
skip values if the char.to_i is a true value
  can you write so the index value counter is changed based on the 
  number of characters is skips?
  New-String so I can use .map

def staggered_case(string)
  
  counter = 0
  
  array = string.chars.map do |char| # splits the stringinto an array made of characters, and transfromed the string
    if char.match?(/[A-Za-z]/) # if a character matches the search criteria of upper/lowercase
      counter += 1 
      counter.odd? ? char.upcase : char.downcase # when a char is hit, the counter increases, when the counter is increased, it changes the outcome for char
    else
      char # this returns the non-alphabetical characters as they are
    end
  end
  array.join #rejion the array together
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

Multiplictative Average
Write a method that takes an Array of Integers as input, multiplies all the numbers togehters, divides, the reuslt
by te number of entries in the Array and then prints te result rounde to 3 decimal places, ASsume the arary isn't empty

to.f(3)


def show_multiplicative_average(array)
  counter = 0
  num = 1
  
  loop do 
    num *= array[counter]
    break if counter == array.size
    counter += 1
  end
  num.to_f(3)
  
  num = (num / array.size)
  puts num
end


def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |num| product *= num }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}" # remember and study this, format('%.3f, average')
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667


Multipy Lists
Write a method that takes two array arguments in which each Array contains a list of numbers and returns 
a new Array that contains the product of each pair of numbers from the arguments that have the same index
ARguments contain the same number of elements

initiate a variable multiply_list that contains two paramaeters, array1, array2
   allow the two parameters to create a new array (.map)
     that new array will require the index of the objects in order to reach oth arguments
     
     array1.map.with_index do |num, idx|
     num * array2[idx]
     end]
  end


def multiply_list(array1, array2)
  array1.map.with_index do |num, idx|
     num * array2[idx]
  end
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

Multiply all pairs
Write a method that takes two ARray arguments in which each Array contains a list of numbers and returns a 
new Array that contains the product of every pair of numbers that can be formed between the elements of the two
arrays.  The results should be a sorted value and you can assume that neither argument is an empty array

initialize method definition with 2 parameters
  the value of each array object in the first parameter needs to be multiplied by the values in teh 2nd
    take the first value and multiply it by eaverything and return that to the array
    can I utilize the 2nd array .map
      array1[0]
    take the second value and multiply that by everything and return tha to the arary
    
    sort the array


def multiply_all_pairs(array1, array2)
  array = []
  
  array1.each do |num| # this follows variable scoping rules to access num
    array2.each do |num2| # this follows variable scoping rules to access num2
      array << num * num2  #num and num2 are scoped within the nested blocks
    end
  end
  
  array.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

The end is near but not here
Write a method that returns the next to alst work in the String passed to it as an argument
Wrods are any dequence of non-blank characters
You may assume that the input String will alwaus cntain at least two words

turn the string into an array of string using .split
  call the second to last value of the array using the index value of -2
    convert that object to a string

can't I just reutn the string as a index value of -2

=end
def penultimate(string)
  string = string.split
  string[-2].to_s
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'


=begin
Write a method that returns the middle word of a phrase or sentence. 
It should handle all of the edge cases you thought of.
=end