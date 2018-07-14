def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(string, repeats = 2)
  ("#{string} " * repeats).strip
end


def start_of_word(str, num)
  str[0, num]
end

def first_word(string)
  string.split(' ')[0]
end

def titleize(string)
  littlewords = %w[and over the]
  string.capitalize!
  string.gsub(/\w+/) {|match| littlewords.include?(match) ? match : match.capitalize}
end
