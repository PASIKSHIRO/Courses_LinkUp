def consonants
  consonants = ('a'..'z').to_a + ('A'..'Z').to_a - vowels
  consonants << 'qu'
  consonants << 'sch'
  temp = Array.new(consonants.size)
  temp.each_index { |i| temp[i] = consonants[i] + 'qu' }
  _consonants = consonants + temp
end

def vowels
  %w[a e i o u A E I O U]
end

def translate(string)
  if
    words = string.split(' ')
    words.each_index { |i| words[i] = translate_word(words[i]) }.join(' ')
  else
    translate_word(string)
  end
end

def translate_word(word)
  capitalize = is_capitalized?(word)
  word.downcase!
  if begins_with_vowel?(word)
    word << 'ay'
  elsif begins_with_three_consonants?(word)
    word = word[3..-1] << word[0..2] << 'ay'
  elsif begins_with_two_consonants?(word)
    word = word[2..-1] << word[0..1] << 'ay'
  elsif begins_with_consonant?(word)
    word = word[1..-1] << word[0] << 'ay'
  end

  word[0] = word[0].upcase! if capitalize
  word
end

def is_capitalized?(word)
  ('A'..'Z').to_a.include?(word[0])
end

def begins_with_vowel?(word)
  vowels.include?(word[0])
end

def begins_with_consonant?(word)
  consonants.include?(word[0])
end

def begins_with_two_consonants?(word)
  consonants.include?(word[0]) &&
  consonants.include?(word[1]) ||
  consonants.include?(word[0..1])
end

def begins_with_three_consonants?(word)
  consonants.include?(word[0]) &&
  consonants.include?(word[1]) &&
  consonants.include?(word[2]) ||
  consonants.include?(word[0..2])
end

