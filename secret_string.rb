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

# Transform triplets into (unique) pairs to be compared
def find_pairs_from_triplets(triplets)
  pairs = []
  triplets.each do |triplet|
    pairs << [triplet[0], triplet[1]]
    pairs << [triplet[1], triplet[2]]
  end

  pairs
end

def find_secret(triplets)
  pairs = find_pairs_from_triplets(triplets)
end
# First letter would be the only one that is never second in a pair
# next letter will also never occur second as soon as the first letter is filtered
# Build your string by adding the first letter, then each new one in sequence

puts find_secret(triplets_1).inspect