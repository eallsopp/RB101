#1 How would you sort this Array of numerical strings in descending order?
=begin
PEDAC
P:roblem: I need to sort an array that is a group of string objects that are each a numerical value
  - EAch of these objects needs to be compared with one another
  - the problem is, strings are evaluated character by character, so they need to be sorted individually
    - strings, in this case, are iterated over
D:ata Set
  Input: a numerical string, that contains 1 or more letters and is positive
    - potential edge cases are 0 and negative string objects
  Output
    - an Array that contains the numerical string objects in descending order, exp ['11, '10', '7, '5, '4']
A:lgorithim
  arr is sorted based on a comparison of two values
  initiate the .sort emthod
    initated a block that contains 2 local variable values, |a, b|
      initiate the .to_i method call on each local variable and initiate an xor comparision operator between a and b
    end the block

arr = ['10', '11', '9', '7', '8']
arr.sort do |a, b| # no need fo the !
  b.to_i <=> a.to_i
end

#2 How would I order the array of Hashes based on publication year from earliest to latest

PEDAC
  Books contains an array of hashes which have ekey value pairs indicated book titles, authors and publishing
  year
  The year is in a numerical string value for 4 charcters, so they can be compared without
  changing to an integer value
E:xample
books[0][:published] == year published
books[1][:published]
books[2][:published]
books[3][:published]...sort by an increasing value
D:ata Struture
  Iterate over the Array BOOKS
  books.each do ....  This is because books has a series of HASH objects, but since is an array I cannot use each_key
  Input: 
    - the value fron published KEY is the comparison with others
  Output:
    An array of objects by numerical string value in ascending order
A:lgorithim
  iterate over the array boks
    initiate the .sort_by emthod on the array object
    initiate a block that initiates the local variable |book|
      compare the [:published] key in the book using the .sort method call
        on those items.  It does not need to be switched because the characters are compared by each character
#2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
books.sort_by do |book|
  book[:published]
end

# How would you reference the letter g in each collection?

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1['b'][1]
p hsh2[:third].key(0)

#4 Practice Problem 4, Whenever the value of 3 occurs, how would you cnange it to 4
arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4


#5 Practice Problem 5
# Figure out the total age of the male members of the family
# I need a place where the male ages can go
# With a Hash Object each key is a string
  Each Value is a hash containing 2 key-value pairs
    those keys are string object age and string object gender
    
I must iterate over the hash and nested hash values
  I need to extract the information for the 'gender' key if it is the string object 'male'
  and if that is true, I need to extract the value from the "age" key and add them together
  for the total age of the male gendered Munsters

D:ata 
See above as I need to extract the value2 if it is 'male'

A:lgorithim
initiate an array object total_male_age
the musters variablecan use the .each_value
  then
    each of those needs to look for the 'gender' KEY
      if the 'gender' KEY, has a VALUE of "male"
        That is TRUE for this example
        
        If "gender" is TRUE
          the 'age' KEY must be looked at, and EXTRACT the VALUE of the 'age' key
            THOSE VALUES CAN ENTER THE total_male_age ARRAY Object
            

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
total_male_age = 0

munsters.each_value do |value|
  total_male_age += value["age"] if value["gender"] == "male"
end
p total_male_age



#6 String Substitution - taking hard coded string and modifying it with various parameters
# from our program

#print out the name age and gender of each family member
Example
  (Name) is a (age)-year-old (male or female).
Data Structure
  input: Hash with KEYS as (NAME)
    VALUES of the (NAME) are hashes with
      ages and gender as KEYS
        Integer and string as VALUES

  OUTPUT:
    (Name) is a (age)-year-old (male or female).

A:lgorithim
  call on the munsters hash with each, with will return the key value pairs "Herman" => {etc..}
    initiate a block with local variable |name|
      call each_value on name with a block |value|
        name.each_value do |value|
         RETURN the value of value, end the block
         return the String 
           (Name) is a (age)-year-old (male or female).
end the block

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}."
end

# Give the code what would the final values of a and b?

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# arr is now [4, [3, 8]]

#8 Using the each method, write some code to output all of the vowels from the strings.
hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |_, array|
  array.each do |letters| # now I have an array of each of the words
    letters.chars.each do |vowel| #here we have the array containing each character ["g", "o", "l", "f", "e", "r"]
        puts vowel if vowels.include?(vowel)
    end
  end
end
# the string vowels does not matter to have spaces, 
# since string objects are looked over character by character

#9 Given this data structure, RETURN a new array of the same structure but with the sub arrays 
# being ordered (alphabetically or numerically as appropriate) in descending order.

# each arary must be compared individually 


arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |array|
  array.sort do |a, b|
    b <=> a
 end
end

#10 Given the following data structure and without modifying the original array, use the map 
# method to return a new array identical in structure to the original but where the value of 
# each integer is incremented by 1.
# I have to transform the hash tha was given to me
# I have to create a new hash for it to contain the new values, with the same keys
# I can use the .each method and iterate over a block f |key, value| pairs
# the NEW_HASH[key] = value + 1
    # the above statement creates the KEY VALUE pairs for te new hash

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# each value is increased by 1
# I can't name it something.  I can't changed the original.  They are all an array of hashes
# the hashes have key value pairs that are symbols as keys and integers 
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
                        # map allows for transformation, over the hsh
  new_hsh = {}
  hsh.each do |key, value| #iterate over the hsh
    new_hsh[key] = value + 1
    end
  new_hsh    
end

#11 Use a combination of methods including the select or reject methods, to RETURN A NEW ARRAY
# identitcal in structure but only containing multiples of 3
# DATA
# return => [[], [3], [9], [15]]
take each value contain in the array structure and select it IF
  if the num % 3 == 0
  or Reject it if
  num % 3 != 0
All objects in the array are the same
  so each sub array contains integers, all of which are the same object Class
  I can iterate over the array using . each
  then transform each individual array if the equation returns 0

A:lgorithim
  call the .map method on the array to get each individual array which will provide the new return value
  then call the .select method on the sub_array which will pick the values with 
  sub_array % 3 == 0
  

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
  arr.map do |sub_array| # map will ultimately return the array based on the criteria below
    sub_array.select do |num| # .select will return the TRUE values based on the criteria below
      num  % 3 == 0 # this is the criteria for multiples of 3
      end
    end

#12 Given the following Data strcuture and without suing the Array#to_h method
write code that will return a hash where the key is the first iten iin each sub array
and the value is the second item

D:ata Structure
 I need to transform a lare array called arr consisting of all types of 
 into a hash with k/v pairs for the where each object in the [0] value of the array is the key and the [1] is the value

using each uses the index value to identify a key
and the following index is the value, inputting the new_hash[item[0]] = item[1]

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# output return {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
new_hsh = {}
arr.each do |item|
  new_hsh[item[0]] = item[1]
end
puts new_hsh

# 13  Given the following data strucutre return a new array, containing the same sub-arrays as the original
but ordered logically by only taking into consideration the odd numbers they contain
# the sorted array should look like [[1, 8, 3]], [1, 6, 7], [1, 4, 9]]
# if a number is odd, that should be the only consideration (.odd?) comparison operator to other array
# the integer within the sub-array is only taken into consideration if it is odd

D:ata Structure
  input is an array of arrays
  output is an array of arrays, ordered by the numerical value of its ODD contents
A: lgorithim
  transform the originaly array object based on 
    comparing one array to another array
      BUT the contents of that array have to be odd values, disregard the even numbers

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.sort_by do |sub_array|
  sub_array.select do |num|
  num.odd?
  end
end

#14 Return an array contains the colors of fruit and sizes of vegetables
# Sizes are uppercase and te colors should be capitalized 
# extract only the COLORS symbol and the SIZE symbol
  # make each item in COLORS .capitalize
  # make each SIZE .upcase

hash each_value do |item|
  (item.each_key |object| #THIS IS UNNECESSARY!)
    if item[:type] == 'fruit'
                (item[:colors].each (remember in here I am transforming an Array!))
      item[:type].map do |str|   (so I can iterate through the array and capitalize the strings in the array)
        str.capitalize
      end
      
      
    elsif object[:type] == 'vegetable'
      object[:size].upcase  (THIS IS ONLY A STRING BJECT AND I DON"T NEED TO ITERATE THROUGH AN ARRAY!)
    end
  end

\
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]



hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_, object|
    if object[:type] == 'fruit'
      object[:colors].map do |str|
        str.capitalize
      end
    elsif object[:type] == 'vegetable'
      object[:size] do |string|
        string.upcase
      end
    end
  end
  
  
#15 Given the data structure, write some code to retun an array whcih contains only the
hashes where all the integers are even
Data Structures:

  because I am returning an array that contains less, I am using transformation over the Entire object
  arr.map
Within the array I have hashes and nested arrays as value objects
so array{hash[array]}]
I only want to return the HASHES that contain the integer objects that are even

map over the whole array
look at key, value pairs of the hashes
  values of the hashes are iterated over with selection for .all?.even?


Algorithim
  iterate over the entire array using .MAP 
    (THIS IS WRONG, it is .SELECT because we are assessing the truth of te value, not transforming any of the objets within the array of hashes)
  
    the collection is then looked at for each_value
      (THIS IS TRUE, HOWEVER, SINCE WE HAVE TO SELECT ONLY THE HASHES THAT CONTAION ALL EVEN VALUES, THIS IS ALL?)
    
      that value is selected if it returns true using .all? initiate a block for |value| value.even? end the block
          (THIS WAS RIGHT)
      
=>[ {e:[8], f: [6, 10]}]
  
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |num| 
      num.even?
    end
  end
end

#16 use hexidecimal characters 
this has to be a string
8-4-4-4-12

random numbers and letters for 8 increments
random nubers and letters fo 4
random for 4
random numbers for 4
random numbers for 12 increments

'a'..'z', 1..9
0..9. each will have to be transformed into a string and pushed to a spot in the hexidecimal value
'a'..'z'.each does not have to be transformated into a string and pushed inot a place holder
uuid is an empty string object
that uuid is generated through random transformation to the uuid

each section contains 8, 4, 4, 4, 12 which can be placed in an array object and transformed from the #
into the string or number in the character hash

=end

