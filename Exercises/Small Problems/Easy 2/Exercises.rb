require 'yaml'
MESSAGE = YAML.load_file('exercises.yml')


=begin
#1 How old is Teddy, uild a program that randomly generates and prints Teddy's age
#To get the age generate a random number between 20 and 200

#PEDAC 
#Using a random number generator get the age of Teddy to appear
#E: example/test cases
#If I have a random number generated I can interpolate the string with a method definition so long as I convert the random integer to a string
#D:ata Structure represent the final output as as string
#A

#C
bear = "Teddy"

def number
  rand(20..200)
end

puts "#{bear} is #{number} years old!"

#2 How big is the room?  Build a program that asks a user for the length and width of a room in meters
#and diplays both meters and square feet.
#1 sq meter is 10.7639 sq ft.
#P: WE have 2 nuerical inputs for length and width of a room, (what if the persn doesn't know it in meters?)
#E An example would be, this room is 5m by 5m so it is 25 sq meters
#D DAta structure, in meters what if the person is American and uses feet?
  #Data will be represented with 2 inputs, as integers, and an output in sq meters
#A Cinverting input to output
  #Integer input is a string so I need to change it to an integer
#C:ode
SQMTR_SQFT = 10.7639

puts ">>Enter the length of the room in meters:"
length = gets.chomp.to_f
puts ">>Enter the width of the room in meters:"
width = gets.chomp.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMTR_SQFT).round(2)

puts "The area of the room is #{square_meters} square meters and #{square_feet} square feet."

#Further Exploration Modify the program to input measurements in feet, and disply sq ft, sq inches and sq centimeters
INCHES_SQFT = 144
CM_SQFT = INCHES_SQFT * 2.54

puts ">>Enter the length of your room in feet:"
length = gets.to_f
puts ">>Enter the width of your room in feet:"
width = gets.to_f

sqft = (length * width).round(2)
inch_area = (length*width*INCHES_SQFT).round(2)
cm_area = (length *width * CM_SQFT).round(2)

puts "The area of the room is #{sqft} in square feet, #{inch_area} in sq inches and #{cm_area} in sq centimeters!"

#3 Tip Calculator Create a simle Tip Calculator Prompt for the bill cost and the tip rate.
#The program must compute the tip and then display both the tip and the amount of the bill.

puts "What is the cost of the bill?"
bill = gets.to_f
puts "What percentage would you like to tip?"
tip = gets.to_f

gratuity = ((tip/100) * bill).round(2)

total = bill + gratuity
puts "The tip for your bill is #{format("$%0.2f", gratuity)}."
puts "The total amounts to #{format("$%0.2f", total)}."

#4 When will I retire?
# Build a program that displats when the user will retire and how many years she has to wrok
#until retirement

P:roblem
Ask the user how old they are
ask the user at what age they would like to retire

Indicate the current year and add the difference between the input ages, to the current year
Print out the amount of years they have to go, the difference between the year it is and the year they wish to retire

#E:xamples
My age is 34
I want to retire at age 70
the difference in these two is 36 years
so if it is 2020, I want to retire in 2056
I have 36 years to go!

D:ata Structure 
  I have two integer values that are inputs
  I have two Time class objects, I can use t = Time.now t.year to call the current year
  The other output will be the current year plus the difference between the inputs from the user
  
  
A:lgorithm
Define a method to get the difference in the two inputs from the user
  validate the inputs for an appropriate value, not negative
  
Define another method which will get the differences in the year

get user input that is an integer for their current age
get user input that is an integer for the age they would like to retire
  This can be the same method, and validate the method to ensure it is not a negative number
  

C:ode
=end
=begin
def prompt(message)
  Kernel.puts ">>#{message}"
end

def age_value(input)
  input = nil
  loop do
    input = gets.chomp.to_i
    break if input >= 0
    prompt(MESSAGE['invalid'])
    end
  input
end

def age_difference(age1, age2)
  age2 - age1
end

age = 0
retirement_age = 0
t = Time.now

prompt(MESSAGE['age'])
age = age_value(age)

prompt(MESSAGE['retire'])
retirement_age = age_value(retirement_age)

puts "It is currently #{t.year}.  You will retire in #{t.year + age_difference(age, retirement_age)}."
puts "You only have #{age_difference(age, retirement_age)} years of work to go unless you win the lottery!"


# Greeting a user
Write a program that asks for the users name.  Program greets the user.  If the person uses a ! at the end of their
name have the computer YELL back to the user.
P:roblem
  write a program
  the program greets the user and asks for their name.  If the person uses a ! at the end of their name, 
  have the computer yell back
  
E:xample
  Can I please have your name?  Erik
    => Hi Erik.
  Can I pelase have your name?  Erik!
  => WHAT"S ALL THE FUSS ABOUT ERIK?

D:ata Structure
  Input: 
    persons name OR a persons name with an exclamation point
  Output:
    Normal Greeting or YELLING GREETING
  
  String for the input
    yields a input from the user
  String greeting 
    either normal or YELLING
    
A:lgorithim
  >>"Please enter your name."
    input = gets.chomp 
  if the response ends in an !
    YELL!
  otherwise
    Normal Boring Greetnig. Hello Muffintop.
    
C:ode

puts '>> Please enter your name.'
input = gets.chomp
  if input[-1] == '!' 
    input = input.chop
    puts "YO #{input} WHAT'S WITH ALL THE YELLING TODAY?"
  else
    puts "Hi #{input}."
  end

# Odd Numbers, Print all Odd numbers 1-99, inclusive on separate lines
P:roblem
I need to print all the odd numbers from 1 - 99 including 1 and 99 on separate lines

E:xample
1-9
1
3
5
7
9

D:ata Structures
an inclusive list of numbers
a condition of ODD
input : a single number, check if it is odd
output: the umber on a single line if it is odd

A:lgorithim
num = 1..99, the .. indicates it is inclusive
for each value in the number scheme, print the number if it is odd

C:ode

for num in 1..99
  if num.odd?
    puts num
  end
end
#try to do that a different way
#all it asks is to print the odd nubers from one to 99
# start with a number until it is 100
# write it as a loop
num = 1
loop do
  puts num
  num += 2
  break if num > 99
end
=end
=begin
#Even Numbers
#print the even numbers from 1-99 inclusive, all numbers printed on separate lines
#Do it differently than either program above from odd numbers

def even(number)
  until number == 99
    number += 1
    if number.even?
      puts number
    end
  end
end

even(1)

numbers = {scope: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
numbers.each do |key, value|
  value.each do |num|
    num.to_i
      if num % 2 == 0
        puts num
      end
  end
end

#Sum or Product of Consectutive integers.
Write a program that asks the user to enter an integer greater than 0 then asks if the user
wants to determine the sum or product of all numbers between 1 and the entered integer.

P:roblem
  write a program asking fo the user to put in a number greater than 0
    then ask the user if they want the sum or the product of ALL numbers between 1 and the entered number

E:xample
  Input a number: 
    10
  Do you want the sum of the numbers between 1 and 10 or the product of 1 and 10?
    sum
.....futuristic beeping computer adding 1, 2, 3, 4, 5, 6, 7, 8, 9
  55

D:ata Structure
  String - asking for numerical input
    input is a string...convert to I
  String - Asking for sum or product
    input is a string or a single character for S or P (downcase)
  .........while the input is taken add or multiply....
  OUTPUT: answer to the above
  
A:lgorithm
  >>Please enter a number greater than 0
    (loop) break if it is an integer, validate if it is not a number (loop)
  >>Would you like the sum 's' or the product 'p' of all the numbers between 1 and you number?  
    (loop) to validate the s/p as the only acceptable answers
  OUTPUT: 
    if input == 's' 
      = sum 1..(number?) syntax is (1..55).sum
      = product 1..(number?)  syntax is (1..55).product

C:ode  

def compute_sum(number)
  (1..number).sum
end

def compute_product(number)
  total = 1
  1.upto(number) {|value| total *= value}
  total
end

number = nil
operator = nil

loop do
  puts ">>Please enter a number greater than 0."
  number = gets.chomp.to_i
  break if number >= 1
  puts "That is an invalid number."
end


loop do 
  puts ">>Thank you.  Would you like the sum 's' or product 'p' of"
  puts ">>  all numbers from 1 to your input of #{number}?"
  operator = gets.chomp.downcase
  break if operator == ('s')
  break if operator == ('p')
  puts ">>That is not a valid input.  Use 's' for sum or 'p' for product."
end


if operator == 's'
  puts "The sum of 1 to #{number} is #{compute_sum(number)}"
elsif operator == 'p'
  puts "The product of 1 to #{number} is #{compute_product(number)}."
else 
  "Something funky is going on.  Try again."
end

#String Assignment

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

#what does that above code print?
# 'Alice'
# 'Bob'

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# But what does this print?
# BOB
# BOB
# I believe they're both BOB, since BOB got changed from Bob, and the caller is mutated in space
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
puts array1
puts array2.object_id
puts array1.object_id
puts array2[2].object_id
puts array1[2].object_id

# What will happen in this code?
# Remember that Array objects are their own object_id
# while the values contained within the array also are their own, so if somethign is pusehd to a new array object, it maintains the same
# object_id, so if it is modified, it is modified.