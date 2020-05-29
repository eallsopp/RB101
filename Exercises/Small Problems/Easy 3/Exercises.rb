#1 Get 5 inputs from the user and get the 6th input to determine whether it appears
#in the first 5 inputs 
=begin
arr = []
puts "Enter your first number:"
first = gets.chomp.to_i
arr << first
puts "Enter your second number:"
second = gets.chomp.to_i
arr << second
puts "Enter your third number:"
third = gets.chomp.to_i
arr << third
puts "Enter your fourth number:"
fourth = gets.chomp.to_i
arr << fourth
puts "Enter your fifth number:"
fifth = gets.chomp.to_i
arr << fifth

puts "Enter your last number:"
last = gets.chomp.to_i

if arr.include?(last)
  puts "The number #{last} appears in #{arr}"
else 
  puts "The number #{last} does not appear in #{arr}."
end

#2 Arithmetic Integer Write a pogram tat prompts the user for 2 positive integers
#and prints the result of the operations listed: addition, subtraction,
#product, quotient, remainder and power.  don't worry about validating the input

def prompt(message)
  puts  (">> #{message}")
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i
prompt("Enter the second number:")
second_number = gets.chomp.to_i

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number ** second_number}")

#3 Counting the Number of Characters
#Write program that will input the number of words and output the number of characters, dont count spaces

ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
def prompt(message)
  puts ">> #{message}"
end

prompt("Please enter a word or series of words:")
words = gets.chomp
p words.count ALPHABET

# This works if it is only letters!
# Now for the real thing
def prompt(message)
  puts ">> #{message}"
end

prompt("Please enter a word or series of words:")
words = gets.chomp
number = words.delete!(' ').size
prompt("The length of your message #{words} is #{number} characters.")

#Multiplying Two Numbers
Create a emthod taht takes two arguments, multiple them together and
returns the result

P:roblem
  Create a method
  Method takes two arguments
  The two arguments are MULTIPLIED together
  Return the Result
  
E:xample
  multiply(4, 6)
  4*6
  result of 4*6 = 24
  
D:ata structure
  Input: 
    argument 1, argument 2
  Output
    Product of argument 1 * argument 2

A:gorithim
  create the method header with 2 paramters (a, b)
    Body of method: a * b
      product is a * b
    end of method
    
C:ode
=end

def multiply(a, b)
  a * b
end

=begin
multiply(3, 5) == 15
multiply([4, 3], 3)

#Squaring an argument
Using the multiply method written in the previos exercise
write a method that computes the square of its argument

P:roblem
  write a method that takes a single argument from the multiply method above, and 
  squares itself, so the number is not **2, it is multiplied y itself a * a
  
E:xample
  5*5 == 25
  
D:ata Structure
  Input: 
    A single integer, retained from the multiply argument above
  Output:
    That integer multiplied by itself

A:lgorithim
  define square(argument)
    argument * argument
  end
=end

def square(a)
  multiply(a, a)
end

square(5)
square(-8)

# further Exploration by generalizing the method to the power of ..... and still musing the multiply method
def general_power(n, x)
  multiply(n, 1)**(x)
end

=begin
#Exclusive Or 
Return if exactly one of the values is truthy
WRite a method named xor that takes two arguments, and retusn true if exactly one of the arguments is
truthy, false otherwise

P:roblem
  Create a method named xor tha ttakes two arguments
  Only one of these arguments needs to be true to return truthy (only one CAN be true)
  returns a boolean true/false value
  
E:xample
xor?(5.even?, 4.even?) == true
xor?(4.odd?, 4.even?) == false

D:ata Structure
  input: 2 arguments
  output: returns the boolean true if only one of the arguments is true
  
A:lgorithim
  definte xor (takes two arguments, arguments)
    condtional statements? can return true if one is true 
    can return false if either botha re true or both are false

C:ode

def xor?(first, second)
  if first == true && second == true || first == false && second == false
    puts false
  else
    puts true
  end
end

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

#For the above I wrote an accurate program to retain the outcome, howevermy thinking, in writing it
# was looking at the arguments, as to whether or not they are true, rather than the program itself
#if that was true.
# A programming consideration should be to look at the overall outcome of the program in addition to 
# the arguments

def xor?(a, b)
  return true if a && !b || !a && b
end
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

#Odd Lists
Write a method that returns an Array, that contains every other element that is passed in as an argument
The values in the returned list should be the values that are the 1st, 3rd, 5th element in the array, and so on

P:roblem  What is my program accomplishing?
  when the index values are even, then the program should return the objects in those positions
  if there are no objects contained in the array, then the return value should be the empty Array
  
E:xample
  oddities([1, 3, 3]) == [1, 3]
  
D:ata Structure
  inputs: Array containing various objects, Integers and strings
  outputs: An Array containing the objects with the indexed values in the 1,3 5 etc.. position
  
A;lgorithim
  initiate a method definition
  initiate a new array that contains the odd_values of the array objects in odd indexed positions
  initiate an index at 0, which will be referenced in the main body of the method definition
  
  initiate a while loop which runs while the index value is less than the size of the array
    - push objects to the odd_values Array, that are indexed in the 0,2,4,6 index values
    - increase the value of the index position by 2
  end the while loop
    return the value of the odd_values Array
  end the method definition
  

C:ode
=end
def oddities(array)
  odd_values = []
  index = 0
  
  while index < array.size
    odd_values << array[index]
    index += 2
  end
  odd_values
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

#how else can I solve this in 2 other ways?

def odd_array(numbers)
  odd_value = []
  
  numbers.each_with_index do |value, idx|
    odd_value << value if idx.even?
  end
  odd_value
end

puts odd_array([1, 2, 3, 4, 5, 6]) == [1, 3, 5]


# another way to write using Ternary operation

def oddies(numerals, odd = true)
  odd ? numerals.select { |item| numerals.index(item).even? } : arr.select { |item| numerals.index(item).odd? }   
end
  

puts oddies([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddies([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
=begin
#Palindromic Strings
write a method that returns true if the string passed as an argument is a palindrome, false otherwise
A palindromme is same backwards as it is forwards, case and punctuation matter!

P:roblem  What am I trying to solve?  What is the question asking?
  write a method that takes a single argument
  That argument takes a string
  Returns Boolean True or False
  The method defintion is looking to see if the string is the same backwards as it is forwards
    Characters matter and so does capitalization

E:xample
  reversed_word('racecar')
  => true
  
D:ata Structures Do I need to change anything?
  It begins and ends as a string, and there is a method call to dow hat I need the 
  the string to do
  
  Input:
    A string 
  Output
    That string is reversed and asks if they are in the same order
  
A:lgorithim

plaindrome?(paramter)
  parameter == paramter.reverse
end

There is a string method called reverse that can be used

def palindrome?(word)
  word == word.reverse
end

palindrome?('madam')
palindrome?('Madam')          
palindrome?("madam i'm adam")
palindrome?('356653') 
palindrome?([2, 3, 4, 3, 2])
palindrome?(['hatchback', 'car', 'hatchback', 'car'])


#Further explore, write a method that can take a string or an Array that does this
# without an if, unless or case statement

# Palindromic stringd Part 2
# Do that same as above but this time make it case insensitive, and ignore non-alphanumeric characters

P:roblem
  Same as above but now, cases do not matter, nor do non numbers a letters
  How do we effect the cases .downcase


def real_palindrome?(word)
  word = word.downcase.delete('^a-z0-9')
  palindrome?(word)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false


def palindrome?(argument)
  argument == argument.reverse
end

def real_palindrome?(string)
  palindrome?(string.downcase.gsub(/[\W]/i, ''))
end

puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

#Palindromic Numbers
Write a mehod that returns true if its integer argument is palindromic, false otherwise
A palindromic number reads the same backwards as forwards


P:roblem  What am I trying to do?  What does the program need to discover?
  Write a method
  Method has an argument
  Returns a boolean true or false for a palindromic number
  
E:xample
  is 456765 the same number as the inverse of it... 567654?
    FALSE
    
D:ata structure
  Input:
    Integer class
  Output
    Integer Class
Is there an easy way to swap the lcoation of the numbers?  No! Integers are immutable
However.digits converts them to an array and .reverse can iterate over an array and then .join
after .join is used, can convert to an INTEGER with .to_i

However, the 0 is included, and will be at the beginning of an example, or any number that originally ends with
a 0

A:lgorithim

definte method(number)
number == number.digits.join.to_i
end 


def palindromic_number?(number)
  palindrome?(number.to_s)
end

puts palindromic_number?(34543)
puts palindromic_number?(123210)
puts palindromic_number?(22)
puts palindromic_number?(5)


def palindromic_number(number)
  number == number.digits.join.to_i
end 

puts palindromic_number(34543)
puts palindromic_number(123210)
puts palindromic_number(22)
puts palindromic_number(5)

=end