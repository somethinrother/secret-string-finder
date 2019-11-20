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
# First letter would be the only one that is never second in a pair
# next letter will also never occur second as soon as the first letter is filtered
# Build your string by adding the first letter, then each new one in sequence