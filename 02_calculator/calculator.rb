def add(number1, number2)
  number1 + number2
end

def subtract(number1, number2)
  number1 - number2
end

def sum(array)
  array.reduce(:+)
end

def multiply(array)
  array.reduce(:*)
end

def power(number, power)
  number**power
end

def factorial(number1)
  (1..number1).reduce(:*)
end
