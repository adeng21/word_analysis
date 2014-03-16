require 'rspec'
require 'pry'
require_relative '../lib/wordanalysis'

describe WordAnalysis do

  let (:wordanalysis) {WordAnalysis.new("The Malaysian Prime Minister stopped short of calling the disappearance of Flight 370 a hijacking! The flight stopped.")}

  it 'provides a count of the number of instances of each word, case insensitive' do
    expect(wordanalysis.word_count).to eq({"the"=>3, "malaysian"=> 1, "prime"=>1, "minister"=>1, "stopped"=>2, "short"=>1, "of"=>2, "calling"=>1, "disappearance"=>1, "flight"=>2, "hijacking"=>1})
  end

  it 'provides a count of the number of instances of each letter, case insensitive' do
    expect(wordanalysis.letter_count).to eq({"a"=> 9, "c"=> 3, "d"=> 3, "e"=> 9, "f" => 4, "g"=> 4, "h"=> 7, "i"=> 10, "j"=> 1, "k"=> 1, "l"=> 5, "m"=> 3, "n"=> 5, "o"=> 5, "p"=> 7, "r"=> 4, "s"=> 6, "t"=> 9, "y"=> 1})
  end

  it 'provides a count of the number of instances of each symbol (any non-letter/non-digit character, excluding white space' do
    expect(wordanalysis.symbol_count).to eq({"!"=> 1, "." => 1})
  end

  it 'lists the top three most common words. If there is a tie, return all words that tie' do
    expect(wordanalysis.top_three_words).to eq([["the", 3], ['flight', 2], ['stopped', 2], ['of', 2]])
  end

  it 'lists the top three most common letters' do
    expect(wordanalysis.top_three_letters).to eq([["i", 10], ["t", 9], ["e", 9], ["a", 9]])
  end

  it 'lists the words only used once' do
    expect(wordanalysis.words_used_once).to eq(["malaysian", "prime", "minister", "short", "calling", "disappearance", "hijacking"])
  end

  it 'lists the number of words only used once' do
    expect(wordanalysis.words_used_once_count).to eq(7)
  end

  it 'provides all letters not used in the string' do
    expect(wordanalysis.unused_letters).to eq(["b", "q", "u", "v", "w", "x", "z"])
  end

end
