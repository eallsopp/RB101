
=begin
dfefine a method that utilizes a specific alphabet that does not include vowels
An array made up of string objects is passed in as the argument
I need to return a new transformed array object witout vowels
  pass in the argment to a block using the .map method
    iterate over the variable for the string, using the string method .delete with string object (aeiouAEIOU) as the argument


def remove_vowels(array)
  
  array.map do |word|
    word.delete('aeiouAEIOU')
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


Write a method that calculates and returns the index of the first Fibonacci 
number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

the input is the number, which refers to the nuber of digits 
the output is the index value of the first number in the series that hits that number of digits(input)

Write the sequence that is the fibonnaci that is going to push the value into a 
new array within the method definition

Assume the argument is always greater than or equal to 2
First nuber has an index of 1
[counter + 1].lengthof the argument,  is the size of the array

loop structure do 
  add the value of the previous number[index] to the new number [index[]]
  
  How to write the fibonnaci sequence
  beginning with the number 1, add that number to the previous number, then next
    So the next index value will be the sum of the previous index and the one previous to that
      can be number[index] = number[index-1] + number[index-2]
     conditional if index = 1 
       number = 1
     else index == 2
      number = 2
    else
      number[index] = number[index-1] + number[index-2]
      
      index = counter
      
      
      index is the reurn 
        push the index value into the array_count
        
      the coutner stops when the argument is equal to the number of digits in the index #'s return value
        break if (return value of index) == array_count.length

outcome will be the size of the whole array

def find_fibonacci_index_by_length(digits)
  array_count = []
  first_number = 1
  second_number = 1
  index = 0
  
  loop do
    
    case index # sorts the fibonnaci into array_count
    when 0
      array_count << first_number
    when 1
      array_count << second_number
    else
      array_count << array_count[index - 1] + array_count[index - 2]
    end
    
    break if array_count[index].to_s.size == digits
  end

  index + 1
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144

# LAUNCHSCHOOL SOLUTOON
def find_fibonacci_index_by_length(number_digits)
  first = 1 #1st number of fibb
  second = 1 #2nd number in fibb
  index = 2 

  loop do
    index += 1
    fibonacci = first + second #3rd number of fibb is 2,
    break if fibonacci.to_s.size >= number_digits # refers to variable, not an array like mine..ok

    first = second # reassign the frist variable to the second
    second = fibonacci # reassign the secnd now to the variable first+second
  end

  index # return value of the method call
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

Reversed Arrays PArt 1
Write a method that takes an array as an argument and reveres its element in place,MEANING,
mutate the array passed into the method, return value should be teh same as the Array object
not alloawed to use Array.reverse

we have an array object that swaps places with objects on the elft and right sides of the array

initiate a variable LEFT_INDEX = 0
initiate a variable RIGHT_INDEX = -1
  this allows us to refer to the objects on either sidde of the array object
  
  initiate a while loop for interation, when the left index value is less than the array.size/2
    (since we are swapping 2 values at a time)
  in order to swap 2 values at a time, we have to reassign left_index and right_index values contained in the array with right_index and left_index
  end the while
  return the array

def reverse!(array)
  left_index = 0
  right_index = -1
  
  while left_index < array.size / 2
  array[left_index], array[right_index] = array[right_index], array[left_index]
  end

  array
end

puts reverse!([3, 2, 5, 6, 8, 3]) == [3, 8, 6, 5, 2, 3]

Reverse Part 2
Write a method that takes an array and returns a new array witht he elemtns fo the rogiinal list in reverse order
Do not modify the original list
definte the method reverse
initialize a new array object
initialize an index value for the items in the original array

initialize a loop that allows iteration through the index vae

  iterate over the array object in reverse order, beginning at index value -1
  reassign the index throughh the index = index - 1


def reverse(list)
  new_array = []
  index = -1
  
  loop do
    new_array << list[index]
    
    break if index * -1 == list.size
    index -= 1
  end

new_array  
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true


Write a methd that takes two Arrays as arguments and returns an ARray that contains all of the values 
from the argument Arrays.  There should be no duplicates in the New Array, even if there are in the original arrays

def merge(array1, array2)
  array = []
  
  array << array1
  array << array2
  array.flatten.uniq
  
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Halvsies
Write a method that takes an array as an argument, returns 2 arrays, as a pair of nested arrays that 
contain the first half and second half of the original aarary and the second half of the original
array, respectively.  if the OG array contains an odd number of elements the middle should be ni the first
half of the array


each_with_index 
if number is < arary.size / 2
  that gets passed into the first half of the array
else 
  that index value gets passed in the second nested array


def halvsies(array)
  first_half = []
  second_half = []
  whole_array = [first_half, second_half]
  
  array.each_with_index do |num, idx|
    if idx == array.size / 2 && array.size == idx * 2
      second_half << num
    elsif idx <= array.size / 2
      first_half << num
    else
      second_half << num
    end
  end
  
  whole_array
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # idx is 0, 1, 2 3, array size is 4, 2 is half
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
puts halvsies([1, 2, 3, 4, 5, 6, 7, 8]) == [[1, 2, 3, 4], [5, 6, 7, 8]] # 4 index value is 3, size is 8

Find the Duplicate 
Give an unordered array and the information that exactly one value occurs twice (each other occurs once)
how would you determine which value occurs twice? Write a method to find the return value that is known in the array.

if the aray has a value taht is the same as another

first sort the array with a mutated method 
  array.sort!
  then find the numbers and their index value
  array.sort!.each_with_index
  
  Now initialize the block with 2 local variables |number, idx|
  
  return the NUMBER if that index value and the next index value are equal



def find_dup(array)
  array.sort!.each_with_index do |number, idx|
    return number if array[idx] == array[idx + 1]
  end
  
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
    
DOES MY list include this
Write a method named include? that takes an Array and a search value as arguments
This method should return true if search value is in the array flase if otherwise.
No use of include? is allowed.

iterate over the array and compare the object to the value argument
Initialize the .each method for the array
  if the array value == value
    return true
  else
  false

def include?(array, value)
  
  array.each do |num|
    compare = num <=> value
    
    if compare == 0 # I could have made tihs simpler by assigning an == to each other
      return true
    end
  end # block is ocer

  false  # remember, the block returning true is all that matters, otherwise itwill be false,
        # no need for an ELSE statement within the block, the method definition will return false
        # if the block does not return true
end


puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

def include?(array, value)
  !!array.find_index(value) # !! returns a true/false value
end
puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false


Right Triangles
Write a method that tkaes a positive integer, n, as an argument and displays
a right triangle whose sides each have N stars, the hyptoeneuse of the triangle
should have one end at the lower left of the triangle anad the other at
the upper right

puts the # of lines and # of spaces

=end

def triangle(sides)
  for stars in 1..sides
    puts ('*'*stars).rjust(sides)
  end
end

triangle(5)
triangle(9)

#top to right bottom
=begin
def triangle(sides)
  stars = '*'
  counter = 0
  
  loop do
    puts stars.center(1) * counter
    
    break if counter == sides
    counter += 1
  end
end

triangle(5)
triangle(9)
=end