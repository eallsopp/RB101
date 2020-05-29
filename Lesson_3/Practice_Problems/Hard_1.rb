
=begin
if false
  greeting = "hello world"
end

greeting
#returns nil since there is no reference to greeting being true, it returns nil since the local variable is not initiatd


# 2 What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# Answer: Should be hi there since the reference of informal_greeting is to the original variable
# :a => 'hi there'

#3 What is printed in each of these code groups?

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is one, two is: two, three is: three

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one is: one two is: two, three is: three
# the method defintion does not change the value of one two three in the local variable scope

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
#one is two, two is three, three is one...the gsub! changes the variable IN ITS PLACE, meaning lines 68, 69, 70
# are also changed to refelct it
=end

#4 Ben was tasked to write a Ruby method
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. 
# You're not returning a false condition, and you're not 
# handling the case that there are more or fewer than 4 components 
# to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # dsw is an array of the numbers
  # there is no indication if the dsw is checked to be a value of 4
  return false unless dot_separated_words.size == 4
  
  while dot_separated_words.size > 0 do # 
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  
  true
end

# the is_an_ip_number method, determind if the number pulled is between 0 and 255
# if you are checking on the value or total number of something...return values can be input into
# the method definitions, hence 
# return false unless ......size == 4 (since the number of the up address HAS TO BE 4 numbers)