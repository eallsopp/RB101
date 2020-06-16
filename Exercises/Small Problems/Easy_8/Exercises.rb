require 'pry'
=begin
Write a method that takes an array of numbers and then returns the sim of the sums of each leading subsequence
for that array. You may assume that the array always contains at least 1 number.

For each value of the array it is adding the next array bject into the mix
  the number of additions is the number of objects in teh array
  
PEDAC
Write a method
  -takes an array of numbers
    -each contains at least 1 number
    -retusn the sum of the sums of each sequence
D:ata Structure
  - Integers
  - Input: inverse relationship between the index value + 1, and total times that number is included in the sum of sums
    -  i.e. array of 3, index[0] is sum 3 times, index[1] is sum 2 times, index[2] is sum 1 time
  - Output: the sum of the numbers inverse relatioinship to the index value

A:lgorithim
  (go back and review the algorithim so I can see that I need those two variables initialized)
  initialize a new variable = 0,  that is going to accepte += num
  initialize a new variable = 0, that is going to accept The SUM_TOTAL += the AOVE VARIABLE
  

  call in the array and invoke with the .each method to iterate through all the numbers
    - initialize a variable that these numbers will be added to (total += num) (total = total + 1, total = 1 + 2, )
    - then intialize another variable that these accrued numbers will teach a sum
      - sum_total += total
      Through one iteration we would have 
        total = total + 1 == 1
        sum_total = sum+total + 1 == 1
        2nd iteration
        total = 1 + 2 == 3
        sum_total = 1 + (1 + 2) == 4
        3rd iteration
        total = 3 + 3 == 6
        sum_total = 4 + (3 + 3) == 10
        
  accumulation of numbers

def sum_of_sums(array)

end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35


# MadLibs
Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

PEDAC
D:ata
 Inputs: 
   noun, verb, adjective, adverb  (each of these can be an initialized variable that we get from the user)
  Output:
   A sentnece that I create whcih uses all 4 user inputs in that story

A:
Looks like we will need to intialize an array that takes each of the inputs from the user, or just palce them all in an array
Initialize a series of 4 inputs  
 - noun
 - verb
 - adjective
 - adverb
 and place them in the initialized array
 
 Create severak sentences which will randomly select the inputs and output a sentence/story with them
   sentence 1: "The #{adjective} #{noun} #{adverb} #{verb}.  (then amnage these sentences with an array.sample), "
   sentence 2:
   sentence 3: 
 
 array = [sentence1, sentence2, sentence3]
 print aray.sample

puts 'Please choose a noun:'
noun = gets.chomp

puts 'Please choose an adjective:'
adjective = gets.chomp

puts 'Please choose a verb:'
verb = gets.chomp

puts 'Please choose an adverb:'
adverb = gets.chomp

sentence1 = "Does your #{adjective} #{noun} #{verb} #{adverb}?"
sentence2 = "Why don't you #{verb}, you #{adjective} #{noun}?"
sentence3 = "The #{noun} is #{verb}, make sure you have your #{adjective} at its height."
 
array = [sentence1, sentence2, sentence3]
print array.sample

SUBSTRINGS
Write a method that returns a list of all substrings of a string that start at the 
beginning of the original string. The return value should be arranged in order from shortest to longest substring.

PEDAC
D:ata Structure:
Input: 
  a single character or a series of charactes, made up for preceding characters to the sum fo the characters
Output
  Each output is a new array consisting of string objects that are concatenated with the previous character(s) given
Algorithim
  there needs to be a looping structure that will add the previous character to the existing character in space
  initilaize a new array that will hold the outcomes
  0.upto(string.size - 1) do |index|   # THIS 0 IS THE INDEX VALUE.. so it will iterate 0, 1 and 2 fo rthe index, then
  outcome << string[0..index]   # amend the new array with the string that consists of 0 inclusive of 0 'a', and then 0..1, 'ab' then 0..2 'abc'
end
outcome
end

a = 'a'
then b is iterated through and adopts the previous solultion + itself  exp 'a' + 'b'
thne c is iterated through and adopts the previous solution + itself exp 'ab' + 'c'

=end
def substrings_at_start(string)
  outcome = []
  0.upto(string.size - 1) do |index|
    outcome << string[0..index]  # this allows for the numerical count to reach the 0..2, or 0..4 and include all values up to that point!
  end
  
  outcome
end
=begin
puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring begins
 This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. 
 Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
 Use the substrings_at_start nethod from the previous exercise

input: 
  is a string and each iteration returns 
Output
  an array of all the possible substrings from string[0..4], then [1..4], then 2..4, thn 3..4 then 4..4
  
  How do I mak the .upto method call take the index 1.upto(string.size - 1)
Alogorithim
  it needs to adapt a string set based on nterger value and index position of the string

def substrings(string)
 
  outcome = []
  (0...string.size).each do |start_index| # this line iterates 0..4, each of the numbers
  current_string = string[start_index..-1]  # this line allows for the new variables to be the reduced string, in the case of 1 on the above line, 'bcde', then 2, 'cde', to the last character [..-1]
  outcome.concat(substrings_at_start(current_string)) # this allows for the previous emthod defintion to defin the new srings from above, which adds to the outcome
  end
  
  outcome
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts substrings('madam') == 
['m', 'ma', 'mad', 'mada', 'madam'
'a', 'ad', 'ada', 'adam' 
'd', 'da', 'dam'
'a', 'am',
'm']
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, 
but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

PEDAC: 
D:ata Strucutre
Input: a string
output: return an array of substrings whose character are the same backwards as they are forwards,duplicate alindromes should be included multiple times

A:lgorithim
USe the substrings method written in the previous exercise
  same characters are in order, 'aba', it is all the characters

Te program will have to iterate through the string
the string will have to be reassigned during the method definition

Create method defintion tha tdefines a palindrome
  def palindrome(string)
    string.reverse == string && string.size > 1
  end
Now I can utilize that in an if statement

How would I utilie the ubstrings string for these, I will have to iterate through the palindrome method definition in order to determin the new_Strings place on 

def substrings(string)
 
  outcome = []
  (0...string.size).each do |start_index| # this line iterates 0..4, each of the numbers
  current_string = string[start_index..-1]  # this line allows for the new variables to be the reduced string, in the case of 1 on the above line, 'bcde', then 2, 'cde', to the last character [..-1]
  outcome.concat(substrings_at_start(current_string)) # this allows for the previous emthod defintion to defin the new srings from above, which adds to the outcome
  end
  
  outcome
end

def palindromes(string)
  result = []
  
  new_strings = substrings(string) # this will return an array of all the smaller substrings ['m', 'ma', 'mad', 'mada', 'madam', 'a', 'ad', 'ada', 'adam', 'd', 'da', 'dam', 'a', 'am', 'm']
  new_strings.each do |strings|
    result << strings if palindrome(strings)
  end
  # result = ['madam', 'ada']
  result
end

def palindrome(string)
  string.reverse == string && string.size > 1
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]


Fizzbuzz
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. 
Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print 
"Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".
input: 2 integers
output: a printed data structure that indicates all integers between the given 2 integers, with 
any integer divisible by 3 with 'Fizz', any number divisible by 5 with 'Buzz' and any integer divisibile by both with 'FizzBuzz'

A:lgoritim
initialize an empty ARRAY strucutre
array = []

integer1 can invoke the .upto method on integer2 and the values can be iterated through

if integer1 % 3 == 0
  'Fizz'
elsif integer1 % 5 == 0
  'Buzz'
elsif integer1 % 3 == 0 && integer1 % 5 == 0 
  'FizzBuzz'
else
array << integer1

case integer
when 

I know I need a case for the ineger or a conditional statement
case statement could be a separate method definition like

  def fizzbuzz_values(num)
  case
  when num is moduloed by 3 is equal to 0 and num moduloed by 5 is equal to 0
    'FizzBuzz'
    when num is moduloed by 3 and equal to 0
    'Fizz'
    when num is moduloed by 5 equals 0
    'Buzz'
  else
  num
end
end
Now we have a case statement that defines what values are the outcomes...
So we need a method defintion that takes those outcomes and puts them in the array

def fizzbuzz(integer1, integer2)
  we have to have the values between integer1 and integer2 be assessed, we can use the upto method on integer1 with the integer2argument
  integer1.upto(intger2) pass in a block
  do |value|
  

def fizzbuzz(integer1, integer2)
array = []

integer1.upto(integer2) do |num|
  
  if num % 3 == 0 && num % 5 == 0 
    array << 'FizzBuzz'
  elsif num % 3 == 0
    array << 'Fizz'
  elsif num % 5 == 0
    array << 'Buzz'
  else
  array << num
  end
end

print array.join(' ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

def fizzbuzz(integer1, integer2)
  array = []
  integer1.upto(integer2) do |value|
    array << fizzbuzz_outcome(value)
  end
  
  print array.join(' ')
end

def fizzbuzz_outcome(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0 
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

fizzbuzz(1, 15) # -> 


Double chars
Write a method that takes a string, and returns a new string in which every character is doubled.
D:Ata 
Input a sring
output that string with each of the characters doubled imemdiately after the first one

Algortihim
initalized a data dructure ARRAY that is empty
since we are turning the string into an array that can be iterated over, use the .split method on the string so we end up with a ['H', 'e', 'l', 'l', 'o'] array

  take each of the characters in the origianl string
    invoke the .each method
    invoke a blcok with |char| as the parameter
  add the same character to itself to make the new character
    new_char = char + char
    array << new_char
  end

array.join('')
end

def repeater(string)
  array = []
  
  string.split(//).each do |char|
    new_char = char + char
  array << new_char
  end
  
array.join('')
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''


Double Char (Part 2)
Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
  unless character gsub 
  
D input: string
  output: string with consonents double, everythign else remains the same
  
A:
intialize new array []

  iterate through the string that is a character 
  deconstruct he charactees into a method definition
    case
    when char == 
  case if the character is 


CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
UPPERCASE = %w(B C D F G H J K L M N P Q R S T V W X Y Z)

def double_consonants(string)
  array = []
  string.each_char do |char|
    array << other_characters(char)
  end
  array.join('')
end

def other_characters(char)
  case 
  when CONSONANTS.include?(char) || UPPERCASE.include?(char)
    char + char
  else 
    char
  end
end
puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""


could also be written as
def double_consonants(string)
array = []
string.each_char do |char|
array << char
array << char if CONSONANTS.include?(char.downcase)
end
array
end


Write a method that takes a positive integer as an argument and returns that number with its digits reversed.
input: an integer
output that integer's #'s reversed and 0's removed if they would begin with 0

Algorithim
take a number and iterate through the number, reversing the digit value



def reversed_number(integer)
  integer.digits.join('').to_i
end


puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1


Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. 
If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.
Datainput string
output, the middle character of that sring if it is odd
or
the middle 2 characters of that string if it is even in length

Agorithim
initiate a varauble chars that is the size of the string

chars = string.size
please the chars in a conditional

if chars.odd?
  I need to count take the size / 2 + 1 and use that for the strig index
  
elsetake the count / 2 and the count / 2 + 1


def center_of(string)
  chars = string.size
  
  if chars.odd? # if it is 13, 13 / 2 is 6 which will give us the 7th letter in the string
    value = chars / 2
    new_string = string[value]
  else
    value = chars / 2
    new_string = string[value - 1] + string[value]
  end

new_string
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
=end