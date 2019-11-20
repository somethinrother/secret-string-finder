secret_1 = 'whatisup'
triplets_1 = [
 ['t','u','p'],
 ['w','h','i'],
 ['t','s','u'],
 ['a','t','s'],
 ['h','a','p'],
 ['t','i','s'],
 ['w','h','s']
]

def find_pairs_from_triplets(triplets)
  pairs = []
  triplets.each do |triplet|
    pairs << [triplet[0], triplet[1]]
    pairs << [triplet[1], triplet[2]]
  end

  pairs
end

# First letter would be the only one that is never second in a pair
def find_next_letter(pairs)
  # loop over pairs, and in each loop, run a smaller one
  # Each smaller loop compares the first letter of the first loop's current iteration
  # with the second letters of each pair.
  # There should only be one letter that doesn't match with any second letter
end

def find_secret(triplets)
  pairs = find_pairs_from_triplets(triplets)
end
# next letter will also never occur second as soon as the first letter is filtered
# Build your string by adding the first letter, then each new one in sequence

puts find_secret(triplets_1).inspect