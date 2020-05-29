=begin
alphabet = 'abcdefghhijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]
  
  if current_char == 'g'
    selected_chars << current_char
  end
  
  counter += 1
  break if counter == alphabet.size
end

puts selected_chars

#modify the string in the array with an 's'
#utilze the same concept for transformation as selection

fruits = ['apple', 'pear', 'banana']
transformed_elements = []
counter = 0

loop do
  current_fruit = fruits[counter]

  transformed_elements << current_fruit + 's'
  counter += 1

  break if counter == fruits.size
end

puts transformed_elements


def selected_vowels(str)
  selected_chars = ''
  counter = 0
  
  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end
    
    counter += 1
    break if counter == str.size
  end
  
  selected_chars
end

puts selected_vowels('shut your mouth and go eat a pie.')


P:roblem
  - write a method that 
  - Select the pairs wen the value is 'Fruit'

E:xample
music = {'Black Sabbath' => 'Metal', 'Gojira' => 'Metal', 'Beastie Boys' => 'Rap'}
return value is all metal 
  metal_value = {'Black Sabbath' => 'Metal', 'Gojira' => 'Metal'}
  
D:ata Structure
  Original - Hash
  Return Value - Hash
  Inputs: 
    a Value = 'Fruit', as the relevant criteria for selection, in the produce Hash
  Output
    The same 'Fruit' Key, Value pair in a new hash

I need to determine the current key  current_key = the name of the variable that uses the method definition's(argument).keys[counter]
I need to determine the current value current_value = produce_list[current_key], the [current_key] is directly from the variale above

A:lgorithm 
  produce hash
  
  initiate a loop
    initiate a variable selected_fruit = {}
    initiate a counter = 0
    
    initiate a variable to select the key[counter]
    current_key = produce.keys
    selected_key = current_key[counter]
    
    current_key[counter]
    
    if (value_variable[counter]) == 'Fruit'
      selected_fruit[counter] = (value_variable[counter])
  place variable selected_fruit as the return value 
end of loop

produce = {'apple' => 'Fruit', 'carrot' => 'Vegetable', 'pear' => 'Fruit', 'almond' => 'Nut'}

def selected_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}
   
  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter] #initiate a variable current_key, for the counter value of the produce_keys
    current_value = produce_list[current_key] #this is how to definte the hash 'apple' is [current_key] or 'almond' is [current_key]
    
    if current_value == 'Fruit' # We define the value that is within the argument for the method definition
      selected_fruits[current_key] = current_value # here we have the key from the arguement hash, into the new hash, with the same value
    end
    counter += 1  #count increases
  end
  
  selected_fruits    # return value of the hash
end

puts selected_fruit(produce)

# Transformation Example
def double_numbers(numbers)
  doubled_numbers = []
  counter = 0
  
  loop do 
    break if counter == numbers.size
    
    current_number = numbers[counter]
    doubled_numbers << current_number * 2
    
    counter += 1
  end
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_numbers(my_numbers)

# Implement a method that MUTATES double_numbers, rather than transforming it to a new Array

def double_numbers!(numbers)
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    numbers[counter] = current_number * 2 # returns a reference to the original array
    
    # since the 2 lines above, reference the same conditions it can be shortened to
    numbers[counter] *= 2
    
    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_numbers!(my_numbers)
puts my_numbers # this is now permanently modified

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number
    
    counter += 1
  end
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_numbers(my_numbers)
my_numbers

# What if we want to transform the numbers based on index position?
# rather than their value?
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    current_number *= 2 if counter.odd?  #right here is the change, from the current number to the counter
    doubled_numbers << current_number
    
    counter += 1
  end
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_numbers(my_numbers)
my_numbers

#More Flexible Methods

# If we want to create a new hash BASED ON SELECTION CRITERIA
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}
  
  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end
    
    counter += 1
  end
  
  selected_produce
end


# we want to update the method to double values in the array, but also
# to multiply by any number.  Create a emthod called multiply
# that can take the additional argument to determine its 
# transofrmation criteria

def multiply(my_numbers, integer)
  selected_numbers = []
  counter = 0
  
  loop do
    break if counter == my_numbers.size
    
    selected_numbers << my_numbers[counter] * integer
    
    counter += 1
  end
  selected_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3)

question = 'How many times foes a particular character appear in this sentence?'

def select_letter(sentence, character)
  selected_chars = ''
  counter = 0
  
  loop do
    break if counter == sentence.size
    current_char = sentence[counter]
    
    if current_char == character
      selected_chars << current_char
    end
  
    counter += 1
  end
  
  selected_chars
end

puts select_letter(question, 'a')
# we can chain methods together, like so
puts select_letter(question, 't').size
select_letter(question, 'z')
=end

{a: "ant", b: "bear", c: "cat"}.each_with_object([]) do |pair, array| 
  array << pair.last
end

long, short = {a: 'ant', b: 'bear', c: 'cat'}.partition do |key, value| value.size > 3 end
puts long
puts short