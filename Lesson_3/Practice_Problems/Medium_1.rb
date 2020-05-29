# 1 ASCII Art
=begin
# Write a one-line program that created the following output 10 times,
# with the subsequent line indented 1 space to the right.
10.times {|number| puts (' ' * number) + "The Flintstones Rock!"}

# 2 This results in an error 
puts "The value of 40 + 2 is " + (40 + 2)

# This error happens because an integer cannot be coerced into a string...
# It can be fixed by string concatentation or string interpolation
puts "The value of #{40} + #{2} is" + (40 + 2).to_s
# OR
puts "The value of 40 + 2 is" + " " + "#{40 + 2}"

# 3 Alan wrote this, meant to show all the factors of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
  divisor -= 1
  end until divisor == 0
  factors
end
=end
# use a loop on the code above not begin/end/until

def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(1000)

# Bonus 1 the line number % divisor == 0, if the reaminder is 0 the numbers are 
# divisible, and the divisor will be a factor of the number
# Bonus 2 like 37 in the method, is the return value, since method definitions return the last
# line in the method
# above could also be 
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(1000)

# 4 Implement a rolling buffer
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element 
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# is there a difference between the two? other than the operators she
# chose to add an element to the buffer?
# Yes. RB2 does not alter the caller's input argument, RB1 does!

# 5 This code has the limit variable outside fo the scope of the emthod definition
# so it is not reached in teh while loop below.
=begin 
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
=end

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

#6 Output of the code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)
p answer - 8 # 34 answers variable is 42, so p 42 - 8 

# 7 Munster Family
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
# does the above emthod call ransack the data?  Why or why not?
# yes, it removed all the names of all the family members, demo_hash could
# be reassigned which would retain the stored value of the munsters data,
# but since it doesn't the munsters original is modified

#8 What is the result of the call below? whatever hand was used in the tie as the result of the tie
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# at each argument, you retunr a value, and in this case the final returns paper

# 9 consider the simple methods!
def foo(param = 'no')
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# what is the return value for:
bar(foo)
# fun brain puzzle, foo returns "yes" so bar("yes") leads to a false "no" leading to "no"
