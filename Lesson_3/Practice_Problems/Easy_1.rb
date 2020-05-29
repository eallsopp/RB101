=begin
# Practice Problems 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# I would expect the code to print out 
# 1
# 2
# 2
# 3

# 2 Describe the difference between ! and ? in Ruby, explain what happens in the following
# What is != and were should you use it
# != is a way to designate two objects as 'not equal to'

# A single ! before somthing, like !user_name
# a way to write an object is the opposite boolean

# a single ! after something like words.uniq!
# This is way to modify the method call, and indicate it is mutating the caller
# if it is a method, it depends on ruby syntax

# ? before something, is a ternary operator for if/else

# ? After something is another addition to a method call and depends on context

# !! before something is a way to turn something into its boolean equivelant

# 3 replace the word "important" with "urgent" in the string
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
p advice

# 4 Ruby Array class has several methods for removing itens from the array.
# See how they differ.
numbers = [1, 2, 3, 4, 5]

# what does 
numbers.delete_at(1) # do (this will delete the number at index 1)
# vs.
numbers.delete(1) #this will delete the number 1 from the array
# they return => 2 and => 1 respectively
# numbers will return => [1, 3, 4, 5]
# and => [2, 3, 4, 5] respectively

# 5 Programmatically determine if 42 lies in between 10 and 100
range = 10..100
p range.include?(42)
# numeric values can use .include? like .cover?

# 6 famous_words
famous_words = "seven years ago..."
# show 2 ways to put the expected "Four score and" in front of famous_words
p "Four score and " + famous_words.to_s
p "Four score and " << famous_words.to_s
p famous_words.prepend("Four score and ")

# 7 Build an Array like this
flintstones = ["Fred", "Wlima"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# this ends up with a nested array, make it un-nested
flintstones.flatten!
=end

# 8 Given the hash
flintstones = {"Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5}
# Turn this into an array containing only 2 elements, Barney's name and Barney's number

# flintstones.delete_if {|key, value| key != "Barney"} # This returns a hash!
# p flintstones

p flintstones.assoc("Barney") #this is the correct output, an array containing only 2 elements!

