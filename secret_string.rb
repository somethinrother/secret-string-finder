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
  attr_accessor :letters, :pairs, :secret_word

  def initialize(triplets)
    @pairs = find_pairs_from_triplets(triplets)
    @letters = @pairs.flatten.uniq
    @secret_word = ''
  end

  def find_secret_string
    find_next_letter until @letters.empty?
    @secret_word
  end

  private

  def find_pairs_from_triplets(triplets)
    triplets.each_with_object([]) do |triplet, pairs|
      pairs << [triplet[0], triplet[1]]
      pairs << [triplet[1], triplet[2]]
    end
  end

  def find_next_letter
    next_letter = nil

    @letters.each do |letter|
      letter_is_valid = true

      @pairs.each do |pair|
        letter_is_valid = false if letter == pair[1]
      end

      next_letter = letter if letter_is_valid
    end

    if next_letter
      @letters.delete(next_letter)
      @pairs.each do |pair|
        pair.delete(next_letter) if pair.include?(next_letter)
      end
      @secret_word += next_letter
      next_letter
    end
  end
end
