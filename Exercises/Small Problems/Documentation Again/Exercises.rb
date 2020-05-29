=begin
require 'date'
puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)
puts Date.new(2016, 5, 13, Date::ITALY)
puts Date.new(0, 3, 30)

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
#Ruby calls the first and last arguments (4,6) to the first and last arguments (a, d) of my_method
#The 5 remains and exists for b, c remains 3

#4 Mandatory Blocks #how to search the array for the first element whose value exceeds 8?
#The bsearch method does a binary search fr instances invoked in the block.
#The array it is searching, must already be sorted.  
a = [1, 4, 8, 11, 15, 19]
p a.bsearch {|x| 8 < x}

#5 Multiple Signatures
a = %w(a b c d e)  #this is shorthand for an array %w(arguments)
puts a.fetch(7)  #fetch tries to return the element in the index position this will return error, out of bounds
puts a.fetch (7, 'beats me') #this will return beats me, since there is no 7 index, it returns the default argument (beats me)
puts a.fetch(7) {|index| index**2} #will return 49, the index call is 7**2

# the index positon lies outside the array bounds, 
# the firs throws an error message since the call is outside the index value
#the second throws 'beats me' since it can return the 'beats me' as a default
# the third throws 7**2 which is 49 since the block is executed due to the invalid index call
#fetch returns a few, and does bounds checking to see if the array contains those indexed values


#6 Keyword Arguments what does this code print
5.step(to: 10, by: 3){ |value| puts value}
#step method nvokes the block, starts at 5, by 3 at a time until it reaches 10 as the limit

#7 Use IRB to print the following code
s = 'abc'
puts s.public_methods.inspect
#This will print all of the available methods to this call, which will then indicat3
#all string instances, as well as Kernal, Object, BasicObject...
#To exclude these arguments, s.public_methods(all=false).inspect
#the all=false will exclude arguments outside of the string class

#8  find documentation in min method and change the code to print the 2 smallest values
a = [5, 9, 3, 11]
puts a.min
#code should be
puts a.min(2)
#could also be 
puts a.min(2) {|a, b| a <=> b}
=end

# down the Rabbit Hole
# YAML::loadfile is under the Psych Module when you search
# important to note that existing modules can be hidden in other modules