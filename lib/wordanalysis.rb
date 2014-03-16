require 'pry'

class WordAnalysis

  def initialize(string)
    @string = string
  end

  def word_count
    string_to_search = @string.downcase.split(/[^a-z]/).select{|word| word=~/[a-z]\S+/} #puts string into array, takes out all symbols, numbers, and letters

    word_hash = Hash[string_to_search.uniq.map{|v| [v, 0]}] #make a hash with each word in array as key, with a starting value of 0

    string_to_search.each do |word|
      word_hash[word] +=1
    end
    word_hash
  end

  def letter_count

    string_to_search = @string.downcase.split(//).select{|letter| letter =~/[a-z]/} #puts string into array, with each letter as a value, taking out numbers, symbols and whitespace

    letter_hash = Hash[string_to_search.uniq.map{|v| [v, 0]}] #make a hash with each letter in array as key, with starting value of 0

    string_to_search.each do |letter|
      letter_hash[letter] +=1
    end
    letter_hash
  end

  def symbol_count

    string_to_search = @string.downcase.split(//).collect{|whitespace| whitespace.strip}.select{|symbol| symbol=~/[^a-z0-9]/} #puts symbols in array, removing whitespace, letters, numbers

    symbol_hash = Hash[string_to_search.uniq.map{|v| [v, 0]}]

    string_to_search.each do |symbol|
      symbol_hash[symbol] +=1
    end
    symbol_hash
  end

  def top_three_words

    sort_words = word_count.sort_by {|key, value| value}.reverse #sort word_count hash in descending order

    index = 2

    until sort_words[index][1] > sort_words[index+1][1]
      index +=1
    end

    sort_words[0..index]
  end

  def top_three_letters
    sort_letters = letter_count.sort_by {|key, value| value}.reverse #sort letter_count hash in descending order

    index = 2

    until sort_letters[index][1] > sort_letters[index+1][1]
      index+=1
    end
    sort_letters[0..index]
  end

   def words_used_once
    words_used_only_once = []

    word_count.each do |key, value|
      if value == 1
        words_used_only_once << key
      end
    end
    words_used_only_once
   end

   def words_used_once_count
    words_used_once.count
   end

   def unused_letters

    unused = []

    ("a".."z").each do |letter|
      if letter_count.has_key?(letter) == false
          unused << letter
      end
    end
    unused
   end

end


