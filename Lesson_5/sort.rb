# Sort sorts objects based on xor <=> whcih will returna  -1 0 or 1
# if it can't compare obects like 'a' <=> 1 it returns nil

# What will be returned
['arc', 'bat', 'cape', 'ants', 'cap'].sort

# => ['ants', 'arc', 'bat', 'cap', 'cape']

#What about with an array of arrays?
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

#Can sort_by index value, since sort_by is called with a block
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# this => ['mat', 'bed', 'cot']

#Hash Values can be done ssing sort_by
people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

#When referrin to a symbol, we are effectively comparing strings
# sometimes, we may need to run it through a method, like .capitalize
# ina  block, in order to gain ASCII comparison accurately, such as 
people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]

# Other methods using comparison:
# min, max, minmax, min_by, max_by, minmax_by