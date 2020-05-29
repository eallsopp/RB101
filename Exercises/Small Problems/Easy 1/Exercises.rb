=begin
#1 Repeat Yourself Write a method that takes 2 arguments, a string and a 
#positive integer, and prints the string as many times as the integer
#indicates

#PEDAC
#Understand the problem :identify input/output
#:make requirements explicit
#:identify the rules
#Mental Model the Problem
#P
# Write a method with 2 arguments, a string and an integer
#it prints the string as many times as the given integer
#I have what is going to be printed and how many times it is
#name of method is repeat

def repeat(string, integer) #my default for the arguments is (a,b), but considering someone may look at the code, I should 
#make the argument a little clearer
  integer.times do 
    puts string
  end
end

repeat('Hello', 3)

#2 Odd Write a method that takes a 1 integer argument, + - or 0
#method will return true if absolutel value is odd
#assume the argument is valid integer value...no #odd? or #even? method calls allowed!

=begin 
PEDAC 
P Understanding the Problem
inputs- an integer as the input, could be positive negative or zero
no use of #odd? or #even? method calls
the method call will return true or false (boolean value)
how to code for an absolute value?  (.abs call!)
how about zero? Zero has neither odd nor even value, how to code?
#do we code at all, or can I create a condition where 0 is inclusive?
#All we need to output is zero is false, so no special condition.

E:xamples
a number 2 goes through the method definition and output as even
Edge Cases: negatives, so attend to absolute value in code
Edge Cases: 0, attend to an argument 0 in code

D:ata Structure
a single integer, also output for a boolean can be puts
We can use MOdulo % 2 for a remainder == 1

A:lgorithim
method defintion arguments
  method defintiion parametns 
end of method
variable inputs
.abs method call for an absolute value covers negatives

C:ode.



def is_odd?(num)
  num.abs % 2 == 1
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
puts is_odd?(7)

#3 List of Digits Write a Method that takes on argument, 
#and returns a list of digits in the number
#PEDAC
#P:roblem - take a sincgle integer, and convert it to an array that consists of the list of digits in order
#E:xamples
# The number 1001 gets put through the method I make and it reutns "1", "0", "0", "1"
#Data structure - our arguments begin as a single integer and get returned in an Array
#Algorithim Convert the input to the output
  #The method definition digits would work on th einteger, hwoever digits returns the array with the lowest value first
  #digits will need modification fi I use it for the third item in the arguments given
  #How can I code a number like 7688431?
    #I can code it to remove and put numbers back in
    #I could take numbers out and put them back in using push? or .last to index[0], reversing a counter for each one?
    #I can find a method that works to reverse an array...like .reverse!
    #But remember, it must return a Boolean
    
def digit_list(integer)
  return integer.digits.reverse
end
  
puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

#4 How Many? write a method that counts the number of occurances in the array

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
'motorcycle', 'motorcycle', 'car', 'truck']

#The words in the array are case-sensitive: 'suv' != 'SUV'. 
# Once counted, print each element alongside the number of occurrences.
#iterate over the array, for strings that equal certain instances

#P:roblem
# write a method
# th method counts EACh fo the elements in the array
# once the elements ave been counted, print each element alongside the numebr of occurances
# due to the 'print each element along side the number of occurences' i know i need to convert
# those elements into a container for the number of occurences... a hash
#E"xample
['car', 'car', 'bike']
car => 2
bike => 1
#Data Structures
  I need a hash to contain the key adn the number of occurances
  array the counts the number of occurences
    that array will need to be iterated through to count the total number of occurences of the element
  
#A:lgorithim
  define the method count_occurecnes with the argument array
    create a new hash
      iterate through the array, as each item in the array
        create the hash = the count of the items in the array
    
  iterate over the hash for its key, value pairs
    print out the key => value
  end

#C:ode

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
'motorcycle', 'car', 'truck']

def count_occurences(array)
  occurences = {}
  array.uniq.each do |element|
    occurences[element] = array.count(element)
  end

  occurences.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurences(vehicles)

# 5 Reverse IT Part 1 RETURN TO THIS AT 4pm!
P:roblem 
  write a method that takes an argument
  that argument is a string
  it will return a new string in reverse order by word, not b character
E:xample
  sentence = "melt banana"
  ....iterate through magical beeping program.....
  returns: "banana melt"
D:ata Structure
  it is a string and a sentence for a method definition
  inputs: a string through the method definition
  output: that same things with the words reversed in order
A:lgoritihim
  Are there methods I can use to make the words swap position?
  the ones that come to mind to check are .reverse, .split (converts to an array)
  .join as well, which is

def reverse_sentence(sentence)
  sentence.split(' ').reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

#Reverse It Part 2
Write a method that takes one arguement, a string containing 1 or more words
and returns the given wstring with words that contain 5 or more characters reveresed
Each string consists of only letters and spaces Spaces should be included when one or more 
than 1 word is present

P:roblem
write a method that takes a single argument
  the argument is a string of 1 or more words
  return the string, under the condition that any worrrd with 5 or more characters
  is reversed
  spaces are included, hould be included with the final outcome if more than 1 word is present
  
E:xample
'I have thirteen cats.'
wil run through the meth def
'I have neetriht cats.'

D:ata Structure
  a string, I might have to move into an array, but I will see
  input
    string of characters that may contain spaces
  output
    the same string, however words that have 5 or more characters will be reversed
    
A:lgorithim
  write a method defintion that takes a (parameter)
    convert the object to an array with the split method
      iterate through each object in the array
        if that object has 5 or more characters (.length method call) reverse the word
      join the array back together
  
    iterate through each item in the array, if the item has 5 or more characters, reverse it

def reverse_words(sentence)
  sentence = sentence.split(' ')
  sentence.each do |word|
    if word.length >= 5
      word.reverse!
    end
  end
  sentence.join(' ')
end

puts reverse_words('Professional')
puts reverse_words("Walk around the block")
puts reverse_words('Launch School')

#STringy Strings
Write a method that takes one argument, a positive integer, and retunrs a 
string of alternating ones and zeros, that always starts with 1
Length of the sstring should match the given integer

P:roblem
#Write a method that takes a single argument, a positive integer
# It returns a string of 1's and 0's
# Always begins with a 1, length of string matchs the value fo the integer

E:xample
method(4) == '1010'

D:ata Structure(s)
  input:
    integer
  output
    string of 1's and 0's
deconstruct the integer into something that can be counted
  .times - will run a number the amount of times based on its value and put thru
  a block
  that can then be in an index value that is recognized as even or odd
    that even/odd can indicate the 1 or 0
  that 1 or 0 can be PUT into a blank array
  ...
  once the array is done it can be put together
  

A:lgorithim

make a new array to hold the value of the block

  take the number of times of the integer and iterate
    iteration determines t or f and assigns a 1 for true and a 0 for false
    1 or 0 gets pushed into the array
  end the block
  
  array variable is the final line in the method definiton, but it needs to be conJOINed
end

def stringy(number)
array = []
number.times do |index|
string = index.even? ? "1" : "0"
array << index
end
array 
end

C:ode
=end

def stringy(number)
  array = []
  
  number.times do |index|
    string = index.even? ? 1 : 0
    array << string
  end
  
  array.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=begin
# Array Average
  Write a method that takes an argument, an array of integers, and returns
  the average of all the numbers in the array
  the array will neve rbe empty, and the numbers will always be positive 
  integers
P:roblem
  write a method
  the argument will be an array of integers
  it will return the average of all the numbers in the array
  all numbers will be postiive integers, and no empty arrays are the argument
  
E:xamples
  example([4, 6, 8, 10, 12]) == 8
  
D:ata Structures
  inputs: an array of various positive integers
  we will need to add all of the integers together SUM
  through this process we will need to COUNT the array for a denominator
    in order to get the average we will need to add all the values of the
    array together
  output: a single integer

A:lgorithim
definte the method average(parameter)
  get the sum of the array
    total = parameter.sum
    denominator = parameter.count
  
  total / denominator
end

C;ode

def average(array)  
  total = array.sum
  denominator = array.count
  total/denominator
end
  
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Sum of Digits
Write a method that takes a positive integer as an argument and returns the sum of its digits

P:roblem
  Write a method
  method takes an integer
  the method returns the sum of the digits in the integer

E:xample
method(14) == 1 + 4 == 5

D:ata Structures
beginning as an integer an array structure could deconstruct the 
integer with .digits
sum of the array

A:lgorithim
def sum(integer)
  array = integer.digits
  array.sum  

C:ode

def sum(number)
  array = number.digits
  array.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

#What's my bonus?
Write a metod that takes two arguments, a positive integer and a boolean
and calculates the bonus of a given salary.
If the boolean is true bonus is 1/2 the salary, if false it is 0

P:roblem
method that takes two arguments
  one is an integer
  the other is a boolean
  the method will calculate 1/2 the integer if true, and 0 if false
  
E:xample
bonus(2800, true) == 1400

D:ata Structures
  inputs:  
    integer
    boolean
  
  outputs:
    integer
    
A:lgorithim
bonus(number, boolean)

boolean? ? number/2 : 0  (#does false return false or true?)
end

=end

def calculate_bonus(salary, t_or_f)
  t_or_f ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000