=begin
# Short Long Short
# Write a method that takes two strings as arguments, determines the longer of the two
# return a concatenated short + long + short, can assume strings are different lengths

P:roblem
  write a method
    takes two arguments
    and determines longer of the two
  return a concatenated string of the short, long and short
  
E:xample
  "def", "ghijndnd" => defghijndnddef
  
D:ata Structure
  Input:
    string1s, string2l
  Output:
    string1string2string1

  An item will determine the length of the sring and add the two together
  
A:lgorithim How would I do it?
  create the method definition that takes two arguments
  
  Check the length of each argument and determine which is the shorter on
  Use a conditional to return the a + b + a or b + a + b

def short_long_short(first, second)
  if first.length > second.length
    second + first + second
  else
    first + second + first
  end
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

#What century is that?
Write a ethod that takes a year as an input an returns the century.  Return value should be 
a string that begins with the century number and ends with st, nd, rd, th as appropriate for the number
New centuries begin in years that end with 01, so 2000, is the 20th century

P:roblem
  Take an integer value and convert it to a certain century 'String'
  Integer is always positive
  A century is defined as the year __01 - +1_00
    EXP: 2000 is 20th century, 2001 is 21st century
  Values defined with single integers up to 100 are 1st century
  
E:xample
  4 is the '1st' 
  1087 is the '11th' up to 20th, 2104 is '21st' century
  1127 is the '12th'
  11201 is the '113th' (again, another  112 is 113st, not 113rd)
    
D:ata
  Numbers correspond here with 1st, 2nd, 3rd  4-20 all end in 'th' until 21st
  Input
    Integer value corresponding to a year
  Output
    "String Value corresponding to a century" + 'st', 'nd', 'rd' 'th'
      depending on the numerical value

  
A:lgorithim  
  initiate a method definition with a parameter
    take a value 

Convert a number toa century value
  case statement for the suffix of the value
  
  values ending in 1 are suffixed with 'st'
  values ending in 2 are suffixed with 'nd'
  values ending in 3 are suffixed with 'rd'
  with the exception of from 4 to 20 every 100 years 
    4..20 ends with 'th'
=end

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'


=begin
#Lear Year? Part 1a leap year occurs every year divisible cleanly by 4unless the number is divisible by 100, then it isnt unless its divisible by 400
Assume its good for any year greater than 0
WRite a method that takes any year gretaer than 0 as an input and returns true if it is a leap year, false if not

P:roblem
  Take a number as an argument
  if the number is cleanly divisible by 4 it returns truem unless is divisible by 100, then only if its divisble by 400
  
E:xample
  year(900) == false
  year(1000) == false
  year(10000) == true
  
D:ata Structure What do I have to do
  input:
    integer that is divisiable by 4
  output:
    boolean true or false value
    
determine if the input number is divisble by 4
  returns true
determine if the input number is divisible by 4, && 100
  returns false unless it is divisble by 400
A:lgorithim What's my code gonna do
  

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end


puts leap_year?(2016)
puts leap_year?(2015)
puts leap_year?(2100)
puts leap_year?(2400)
puts leap_year?(240000)
puts leap_year?(240001)
puts leap_year?(2000)
puts leap_year?(1900)
puts leap_year?(1752)
puts leap_year?(1700)
puts leap_year?(1)
puts leap_year?(100)
puts leap_year?(400)

# Leap Year Part 2
Continuation from previous, determine leap years before and after 1752
In this case the year 1752 has the conditions above while prior to 1752 leap years
occurred eery 4 years

P:roblem:
  refactor the code from above, where 1752 is a leap year, and after that, uses the
  code and rules from above (every 4 years, not divisible by 10 unless divisible by 400)
  
E:xample
  2016 == true, 2000 == true, 1756 == true, 1800 == false
  leap_year?(1500) == true
  
D:ata Structure
  Beginning with our mathematical formula
      (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  Add mathematical stipulations for the years greater than or equal to 1752
  and also for the years less than 1752 XOR?
    
    compare_year = year <=> 1752 
  if compare_year >= 0
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    year ? year % 4 == 0 : false
  end

A:lgorithim
  I am navigating the years that are from 1752 onward with an xor operator
  fr values that are equal to or greater than 1752
  And values less than that are valueda t every 4 years
    
def leap_year?(year)
  compare_year = year <=> 1752
  if compare_year >= 0
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    true ? year % 4 == 0 : false
  end
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

# Multiples of 3 and 5
Write a method that searches fo all multiples of 3 and 5 between 1 and a given number argument
and then computes the sum of those multiples.  For instance if the number is 20,
the result will be 98, 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20

P:roblem
  Find the multiples of 3 and 5 from 1 to the given number inclusive of a given number
  make the result the sum of those numbers
  Assume the value of an integer is greater than 1 
  
E:xample
  21 is the number so number from 1..21 that are multiples of 3 are
    3, 6, 9, 12 15, 18, 21
    Multiples of 5 are 
    5, 10 15 20
      add those values together and get 119
      
D:ata Structure      
  Array for 3 array for 5 can be the same array
  Input a number, 
  A multiple is defined as a number divisible by 3 or 5 with remaind 0
  Output is the
    Sum of those multiples (given an array structure, the .sum method can be invoked)
      do i need a new variable?

A:lgorithim
dfine a multisum(number) method
  a blank array is initiated
  the contents of the blank array are the values:
    for i in 2..number
    (I can use if elsif to contain the values for the array)
    if value  = i % 3 == 0 ||  value = i % 5 == 0
    array << value
    
    the array then adds the values together to get the result
    result = array.sum
array contains the value_3 and value_5 numbers
C:ode

def multisum(value)
  array = []
  
  for num in 2..value
    if (num % 3 == 0) || (num % 5 == 0)
      array << num
    end
    array.sum
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

#Running totals
Write a method that takes an array of numbers, and returns an Array with the same
number of elements, and each element has the running total from the original Array
P:roblem
  given an Array of numbers, an array is defined as objects contained within a []
  delimited by (', ')
  Each of those objects is a number
  My program has to use that Array to create a new Array with the same total number of objects
  where each object is the running total of the objects in the original array
  
E:xample:
Array[ 5, 6, 7, 8] == [5, 11, 18, 26] first object is the same, then adds previous # of objects
  
D:ata Structure
  Input:
  An array object containing 0 or more numbers
  Those numbers will be used to create the output of the object
  Output:
    An array containg the values of the existing objects
      where each incremental index value is the accrued sum of that and the preceding index values

A:lgorithim
  array( [number1, number 2, number 3])
    new_array = []
    value = [array[0], array[0] + array[1], array[0] + array [1] + array[2]]
    
    option 1
      iterate through the array and adding additional values as the array gets larger
    option 2
      iterate through the array and add the previous NEW VALUE to the next iteration
      of the NEW VALUE
    iterate trough the array, with the array values pushed to new array
   new_array = value 
   
   Option 3
   uts the .map method to create a new array with each increased value equal to
   the total sum of the origianl array


def running_total(array)
  sum = 0
  array.map {|value| sum += value}
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# SLOW DOWN and ask myself, what are the values doing.  How can I get the values to do
# what those values are intending to do.

# CONVERT STRING TO A NUMBER!
Write a method that takes a String of digits, and returns the appropriate number as an integer
NOT ALLOWED to use .to_i method
For now don't worry about leading + or - signs, nor worry about invalid characters, assume
all values are valid integers
Must calculate the result by analyzing characters in the string.

Problem:
  Turn a string into an integer without existing to_i or Integer() methods
E:xample
  '431' == 431
D:ata Structure
  Exists in a string
  Outputs to an integer
  Hash values allow for assignment of string objects to equal something else
  I can assign each string key '0' => 0

  then iterate through the hash for key, values where each key outputs its equivilant value
A:lgorthim
  create the CONSTANT that will not change
  '0'=> 0, '1': 1 etc...
  
  iniitate a new variable digits to act as the container for an array of characters using the 
    .chars and .map methods to iterate over
      -iterate over each character in the string and convert it to 
      the integer using the DIGITS CONSTANT
      
  initiate a new variable VALUE that acts as the container for the final value Integer
    iterate over the digits Array, which will take each value as an integer
      digit + value * 10 = value
      
    Considerations: each value can be determined
  value

DIGITS = {'0' => 0, '1' => 1, '2'=> 2, '3'=> 3, '4'=> 4, 
'5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}

def string_to_integer(string)
  digits = string.chars.map do |char|
    DIGITS[char]
  end
  
  value = 0
  digits.each {|digit| value = 10 * value + digit}
  value
end

puts string_to_integer('4321') == 4321
string_to_integer('570') == 570


# String to Signed Number
# write a method that takes a string of digits and returns the number as an integer
# The string may have a '-' leading the nunmber or a +, return a - if it exists, otherwise positive
# I can use the string_to_integer method written above
# I can utilize a case statement for when there is a + and - before each numeric value

# if the character value of - is the index[0] position, return it to the final value
# How can I remove and replace the - character? .slice! method with argument (0)
# create a method for a value that is the + or -

def string_to_signed_integer(value)
  if value[0] == '-' || value[0] =='+'
    prefix = value.slice!(0)
  end

  if prefix == '-'
    return -string_to_integer(value)
  else
    return string_to_integer(value)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

# Convert a number to a string without to_s method

#P 
# Given a integer and convert tha same integer to a string
#E
# 543 == '543'
#D
# Integer argument given witht output the same integer to a string containing the same characaters
# A
# initiate the method definition header with a parameter number
# - initiate a count for the nubered index
  # - initiate a variable NUMBER that defines itself as the integer to string call, .digits.reverse
    # - the new array of numbers 
  # - 
# While we have the DIGITS array, convert the integer based on index position
# I can use the [-1] and continue to count backwards?
=end
STRING_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  mod_integer = nil
  array = []

  loop do
    mod_integer = number.divmod(10)
    number = mod_integer[0]
    array = array.prepend(STRING_DIGITS[mod_integer[1]])
    break if mod_integer[0] == 0
  end
  
  array * ''
  
end
=begin

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
=end
#Convert a signed number to a string

def integer_to_string(number)
  mod_integer = nil
  array = []

  loop do
    mod_integer = number.divmod(10)
    number = mod_integer[0]
    array = array.prepend(STRING_DIGITS[mod_integer[1]])
    break if mod_integer[0] == 0
  end
  
  array * ''
end


def signed_integer_to_string(integer)
  case integer <=> 0
  when 1 then "+#{integer_to_string(integer)}"
  when -1 then "-#{integer_to_string(-integer)}" #xor and double negative!
  else
    integer_to_string(integer)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

def new_stringed(integer)
  stringed = integer_to_string(integer.abs) # single lined
  integer < 0 ? '-' + stringed : integer > 0 ? '+' + stringed : stringed
end

puts new_stringed(5432) == '+5432'
puts new_stringed(-4922) == '-4922'
puts new_stringed(0) == '0'

