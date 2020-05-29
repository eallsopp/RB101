# Collections that contain collections
=begin
arr = [[1, 3], [2]]

# Using the reference number of the object, like 
arr[1] = 'hi there'
# is a destructive method that permanently changes the second element in the arr
# array
arr[0][1] = 5 # references a permanant change to the number 3 in arr

arr[[1, 3][1]] = 5 # is the same as 
arr[0][1]

# additional methods on top of the arr, like << can add to the array
arr = [[1], [2]
arr[0] << 3
# This will push the 3 to the array [0][1] position
# I can also add another array instead of an integer
arr[0] << [3]
creates
[[1,[3]], [2]]]
# the above is a 3-layer nested data structure

# OTHER NESTED STRUCTURES
arr = [{a: 'ant'}, {b: 'bear'}]

#2 step process to add another Key Value pair to the first inner hash
arr[0][:c] = 'cat'
arr # => [{a: 'ant', c: 'cat'}, {b: 'bear'}]

arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']
arr[0][1] # => ['b']
arr[1][:b] # => 'bear'
arr[1][:c] # => 'cat'
arr[2][2] # => 'b'  this is in reference to the cab
arr[1][:b][0] # => 'b' this is in reference to the b in bear

# VARIABLES can refer to inner collections directly
a = [1, 3]
b = [2]

arr = [a, b]
arr # => [[1, 3], [2]]

a[1] << 5 
arr # => [[1, 5], [2]]
# by calling arr again, after the destructive method, 
# arr still points to the SAME ARRAY object that is arr

# If we change it via 
arr[0][1] = 8
# It references the SAME object so it is the same as modifying variable
# a above
=end
# DUPLICATE an object with dup and clone

arr1 = ['a', 'b', 'c']
arr2 = arr1.dup
puts arr2

arr2.each do |char|
  char.capitalize!
end
p arr1
p arr2

# .clone preserves the frozen state of the object
# Frozen objects are in a state where they cannot be modified
# It's like a mutable object that can become an immutable object with .freeze
# Check if something is frozen with the .freeze? method