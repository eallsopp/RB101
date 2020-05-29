=begin
# Try not to run example cod for any of these problems to find the answer
# PP 1
# What is the value of the select method below, why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Since .select looks at truthy values, the return value is 'hi' which is truty, therefore select will return
# a new array containing the elements of the originaly array

# PP 2
# How does count treat the block's return value? How can we find out?
['ant', 'bear', 'cat'].count do |str| 
  str.length < 4
end

# Outcome fo the block is 0, since no string is gretaer than 4 characters in length, no true value is returned
# this is based on the documentation for .count, whcih, when a block is given, returns the value based on the
# truthiness of the block's return value

# 3 PP 
# What is the return value of reject in the following code?  Why?
[1, 2, 3].reject do |num| 
  puts num
end

#According to Documentation, returns an array for all elements of enum, for which the block returns false
# if no block is given, an enumerator is returned instead

#4 What is the return value of .each_with.object in the following code?  Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# The value with value[0] is 'a', since it is the [0] index value of the first object 
# hash['a'] = value 'ant'
# hash['b'] = value 'bear'
# hash['c'] = value 'cat'
# return is going to be {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

#5 
hash = {a: 'ant', b: 'bear'}
hash.shift
# removes the first key, value pair a: 'ant' and returns it as a two item array

#6 What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size

#.pop removes the last item in the array and returns it.  Since it is returned, the .size will refer to 
#that array, which is 11, because the return value is a string, not an array

#7 What is the blocks return value in the following? How is it determined? Also, what is the return value of any?
# in this code and what does it output?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
#.any? looks through the block to see if there is a truthy statement for any of the block values given.
# in this case, the rreturn value is determined by the last line in the block, odd? it will return true
# return value only needs to return once

#8 How does .take work?  Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)

#with the arguments above, it will take the first 2 elements of the array
# Returns [1, 2], it is not destructive after testing in irb

#9 What is the return value of .map in the following code?  Why?
{a: 'ant', b: 'bear'}.map do |key, value|
  if value.size > 3
    value
  end
end
# I know map is a mutating return, looks like bear will return
# since if always looks for the BOOLEAN TRUE, the first value 'ant' is a falsy statement in the block
# so, the return becomes [nil, 'bear'] because nthe 'bear' object is returned TRUE

#10 What is the return value of the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# Return value is [1, nil, nil] since puts returns nil

=end

=begin
Implement a method that takes two arguments:

    a sentence string consisting of one or more words
    a value which represents a particular case type from either snake case, 
    camel case or upper snake case

The method should return the given string transformed into the appropriate case.
=end

