# What is happening in the code below?  TRy to describe it as precisely as possible.

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# We are iterating through an Array, with the .each method, in the block
# we create the local variable |arr| as the variable to call .first
# .first on the multi-dimensional Array object, will return the first element 
# in the array(s), sincehte puts method is called we see 1 and 3 printed on screen
# and each array in the MD array is called array, 1 and 3 are the FIRST elements 
# of those arrays the multi-dimensional array object

[[1, 2], [3,4]].map do |arr|
  puts arr.first
  arr.first
end

# What action is being performed?  .map is called on a Multi-dimensional array
# the block calls on each arr and calls the puts method on arr.first
# 1
# 3 are printed as a result, and the return value of the .map method is
# a new array with nil values.  
# Is the return value used by what instigated the action?  yes, the return
# value is called at the end of the block with arr.first
# Since 2 objects were called with map, the return value is [nil, nil]
# however, that is the return of PUTS, arr.first is a new call on te orginal 
# multi-dimensional object, 1 and 3 are returned in the new array from .map 
# emthod call

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# my_arr is a local variable for the multi-dimensional array 
# .each iterates over the multi-dimensional array, referenced by |arr| in the block
# THEN each array is referenced in a nested block through the .each method
# referenced by NUM
# A conditional is called to select num if num is greater than 5, it will
# be displayed on the screed with the method call PUTS
# the return value of puts is nil, which is not used and 
# my_arr return value is [[18, 7], [3, 12]]

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# What will the return value be in this example? Use what you've learned so far to
# break it down on your own before checking the solution below.
# arr.map returns a new array
# a multi-dimensional array is called using map in a block, referenced by |arr|
# arr is then referenced and the .map method is used again, initiating a block
# with num referenced in the block.  num is multipled by 2 at the end of the
# block
# the return value of this will be a new nested array of [[2, 4], [6, 8]]

# with an Array of Hashes
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

# What is going on line by line above?
# line 65: we ahve an array of 2 hashes that is called on using the select method
# then a block is initialized and |hash| references the objects in teh array
# being called on
# line 66: the .all? asks for boolena returns if they are ALL true
# line 67: asks, does the first letter in the VALUE reference, the same letter
# as the key,
# since we have a nested hash, we have 2 hashes, where we wil return 2 answers
# to the hash.all? method call, return will be false, true, so the true selection
# is [{:c => 'cat'}], which will be the return, since the .select method references
# true false values


# SORTING NESTED DATA STRUCTURES

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# I cannot just call .sort on this, since NUMERICAL STRINGS are sorted by CHARACTER
# and I want them sorted by numerical value, even though they are strings
# I  have to TRANSFORM the array, to a structure that will sort 
# and return the sorted array of NUMERICAL STRINGS

arr.sort_by do |sub_array|
  sub_array.map do |num| # sort_by loops for the return on this Transformed MAP object
    num.to_i
  end
end
# Sorted by the sub, that sub array TRANSFORMS the objects with .map and convert
# the arrays to integer values, then sorts then returns 
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

# Working with nested structures made of different objects
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]
# .select does not work with nested data structure so we have to return new array

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item
      item > 13 # this is what we are selecting, provided it returns true on the above conditional
    else
      item.size < 6 # otherwise we are assessing this criteria, the size fo the item is less than 6
    end
  end
end
# => [[27], ['apple']] these remain nested as arrays, since they are not asked to .join, remaining independent

# .map in the above nested array exercise essentially takes
#                 [8, 13, 27], ['apple', 'banana', 'cantaloupe']].map
#                     /                \
#                    /                  \
#                   /                    \
#         [8, 13, 27].select             ['apple', 'banana', 'cantaloupe'].select
#  does each of these fit the criteria       or does these fit the criteria

# TRIPLE LEVEL NESTED ARRAY
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1| #map the multi-dimensional array
  element1.each do |element2| # iterate over the separate arrays referencing element2
    element2.partition do |element3| # each array item in the 2 arrays is partitioned
      element3.size > 0 # is the size of the element considered greater than 0?
    end
  end
end
# break down each component, .each doesn't care about the return value and 
# returns the calling object, that's the only return

#10 We want to increment every number by 1 without changing the data structure
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el| #.map return value is new array containing the objectsin the original
    if el.to_s.size == 1    # it's an integer
      el + 1 
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
#what is the final return value of the expression
# the original object is an array of arrays, containing 2 arrays
# the first array contains an array of arrays and the 2nd contains an array of integers
# line 138 is conducted on the second object, [5, 6] since .map pulls those values
  # and checks the truthiness of their string size, so that returns 5+1, 6+1 => [6, 7]
  #which the el.map do |n| calls on the [1, 2], [3, 4] nested array
# line 141 deconstructs the nested array into 1, 2 and 3, 4, pulling objects from the nested array
  # and transforming them 1+1, 2+1 and 3+1, 4+1
  # => [[[2, 3], [4, 5]], [6, 7]]
  
  # structured wthin the conditional, we can treat EL differently
  # once as an integer and once as an array using if, else
  
# DO NOT MUTATE THE COLLECTION I AM ITERATING THROUGH EVER