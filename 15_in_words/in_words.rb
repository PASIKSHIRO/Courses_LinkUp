module Inwords
  def in_words
    return 'zero' if self.zero?

    number, string = large_numbers(self)
    string << small_numbers(number)
  end

  def large_numbers(number)
    string = ''
    orders = [
        [100, 'hundred'],
        [1000, 'thousand'],
        [1_000_000, 'million'],
        [1_000_000_000, 'billion'],
        [1_000_000_000_000, 'trillion'],
    ]

    orders.reverse.each do |limit, name|
      if number > limit - 1
        quotient, rest = number.divmod(limit)
        number = rest
        if quotient > 0
          string << "#{quotient.in_words} #{name}"
          string << ' ' if number > 0
        end
      end
    end

    return number, string
  end

  def small_numbers(number)
    string = ''
    ones = %w[one two three four five six seven eight nine]
    teens = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
    tens = %w[twenty thirty forty fifty sixty seventy eighty ninety]

    if number > 19 # 20 - 99
      quotient, rest = number.divmod(10)
      string << tens[quotient - 2]
      if rest != 0
        string << ' '
        string << ones[rest - 1]
      end
    elsif number > 9 # 10 - 19
      string << teens[number - 10]
    elsif number > 0 # 1 - 9
      string << ones[number - 1]
    end

    string
  end
end

class Fixnum
  include Inwords
end

class Bignum
  include Inwords
end
