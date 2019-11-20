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

class SecretStringFinder
  attr_accessor :letters, :pairs

  def initialize(triplets)
    @pairs = find_pairs_from_triplets(triplets)
    @letters = @pairs.flatten.uniq
  end

  def find_pairs_from_triplets(triplets)
    pairs = []
    triplets.each do |triplet|
      pairs << [triplet[0], triplet[1]]
      pairs << [triplet[1], triplet[2]]
    end

    pairs
  end

  # First letter would be the only one that is never second in a pair
  def find_next_letter
    # loop over letters, and in each loop, run a smaller one
    next_letter = nil

    @letters.each do |letter|
      letter_is_valid = true

      @pairs.each do |pair|
        letter_is_valid = false if letter == pair[1]
      end

      next_letter = letter if letter_is_valid
    end

    next_letter
  end
  # next letter will also never occur second as soon as the first letter is filtered
  # Build your string by adding the first letter, then each new one in sequence
end

f = SecretStringFinder.new(triplets_1)