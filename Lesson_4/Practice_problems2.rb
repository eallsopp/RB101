
#Given the array:
flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'Pebbles', 'BamBam']
# Turn this array into a hash where the names are the 
# keys and the values are the positions in the array
flintones_hash = {}
flintstones.each_with_index do |key, index|
  flintones_hash[key] = index
end
puts flintones_hash

#2 PP2 
# Add up the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_ages = 0

ages.each_value do |value| 
  total_ages += value
end
puts total_ages

#3 PP Remove people with ages 100 or greater
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! do |key, value|
  value < 100
end
puts ages

#4 Pick out the minimum age from the current Munster family hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

#5 Find the index of the first name that starts with 'Be'
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|name| name[0, 2] == 'Be'}

#6 Amend the array so the first 3 characters are the names
flintstones.map! {|name| name[0, 3]}
puts flintstones

#7 Create a hash that expresses the frequency in whcih each letter occurs in the string
statement = 'The Flintstones Rock'

#String will have to stop if it gets to the end
count = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter| 
  letter_frequency = statement.scan(letter).count
  count[letter] = letter_frequency if letter_frequency > 0
end
puts count

#8 PP 8 What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number #1, 3
  numbers.shift(1) # this would return a array 
end

#Output by this?
numbers = [1, 2, 3, 4]
numbers.each do |number| 
  p number #1, 2
  numbers.pop(1) # returns a new array, removed the last element from the array [4]
end

# PP 9 Write my version of the titleize implementation
words = "the flintstones rock"

def titleize(string)
  string = string.split(' ').map do |word| word.capitalize
  end
  string.join(' ')
end

puts titleize(words)
  
# PP10 Modify the hash so the munsters have an additional age group key that attributes
# one of three values to it, kid, adult or senior kid 0-17, adult 18-64, senior 65 and up

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# PEDAC Nested Hash, add to existing nested hash
# try a case statement
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = 'kid'
  when details["age"]
    details["age_group"] = 'adult'
  else
    details["age_group"] = 'senior'
  end
end