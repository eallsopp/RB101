# 1 Munster Hash
=begin
ages = {"Herman" => 32, "Liliy" => 30, "Grandpa" => 402, "Eddie" => 10}
# See if spot is present
p ages.include?("Spot")
p ages.has_key?("Spot")
p ages.key?("Spot")
p ages.member?("Spot")

#2 Starting with this string:
munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways, on the original

p munsters_description.swapcase
p munsters_description.sub("M", "m")
p munsters_description.downcase
p munsters_description.upcase

#3 Munster family age hash, add the ages for Marilyn and Spot
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = {"Marilyn" => 22, "Spot" => 237}
ages.merge!(additional_ages)

# 4 See if the name "Dino" appears below:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino")
p advice.match?("Dino") # LS answer, but I don't understand why include? is not

# 5 Show an easier way to write this array
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)

# 6 How can we add Dino to the flintstones array?
flintstones << "Dino"

# 7 Snce we used the shovel to add Dino to the flintstones array, 
# we could have used Array#concat or Array#push to add to the family
# How can we add multiple items to our Array? Dino and Hoppy
p flintstones.push("Dino", "Hoppy") #this works to add to the end, LS example is .push("Dino").push("Hoppy")
flintstones.insert(1, "Dino", "Hoppy") #This inserts them in a certain place
flintstones.unshift("Dino", "Hoppy") # This inserts them in the beginning

# 8 Shorten this sentence
advice = "Few things in life are as important as house training your pet dinosaur."
# remove everything starting from "house" using Slice

#If I use slice, I need to include a range of index values
# using slice, leave advice variable as "house training your pet dinosaur."
p advice.slice!(0..38) # this was me, however you can use an index method 
advice.slice!(0, advice.index('house'))
p advice

p advice.slice(0, advice.index('house')) #without the !, it does not return the sliced value!
=end
# 9 Write a one liner to count the number of lower-case "t" characters in the following string
statement = "The Flinstones Rock!"
p statement.count('t')

#10 If we had a 40 character wide table of Flintstone members, how could we center
# the title with spaces?
title = "Flintstone Family Members"
p title.center(40)