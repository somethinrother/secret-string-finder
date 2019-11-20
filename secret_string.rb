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
    @letters = find_letters_from_pairs
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
      @pairs.each { |pair| letter_is_valid = false if letter == pair[1] }
      next_letter = letter if letter_is_valid
    end

    process_correct_letter(next_letter) if next_letter
  end

  def process_correct_letter(correct_letter)
    # Remove instances of found letter in pairs
    @pairs = @pairs.map do |pair|
      pair.reject { |letter| letter == correct_letter }
    end
    @letters = find_letters_from_pairs
    # Add letter to secret word
    @secret_word += correct_letter
    correct_letter
  end

  def find_letters_from_pairs
    @pairs.flatten.uniq
  end
end

# Ensure function works
finder = SecretStringFinder.new(triplets_1)
secret_string = finder.find_secret_string
puts "Your secret word is #{secret_string}"
puts "Correct Match? : #{secret_string == secret_1}"
