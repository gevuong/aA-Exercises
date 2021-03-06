# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  str.split.map { |word| [word, word.length] } .to_h
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.each_key { |key| return key if hash[key] == hash.values.max }
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each { |key, val| older[key] = val }
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  ch_count = Hash.new(0)
  word.chars.each { |ch| ch_count[ch] += 1 }
  ch_count
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  arr.map { |int| [int, 0] } .to_h.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = { even: 0, odd: 0 }
  numbers.each do |int|
    hash[:even] += 1 if int.even?
    hash[:odd] += 1 if int.odd?
  end

  hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels_count = "aeiou".chars.map { |ch| [ch, 0] } .to_h
  string.each_char { |ch| vowels_count[ch] += 1 if "aeiou".include?(ch) }
  vowels_count.each { |key, val| return key if val == vowels_count.values.max }
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  students.select { |_, val| val > 6 } .keys.combination(2).to_a
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  specimens_count = specimens.map { |specimen| [specimen, 1] } .to_h
  specimens_count.keys.length**2 * (specimens_count.values.min / specimens_count.values.max)
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  character_count(normal_sign).all? { |key, val| character_count(vandalized_sign)[key] <= val }
end

def character_count(str)
  ch_count = Hash.new(0)
  str.delete("!?',. ").downcase.each_char { |ch| ch_count[ch] += 1 }
  ch_count
end
