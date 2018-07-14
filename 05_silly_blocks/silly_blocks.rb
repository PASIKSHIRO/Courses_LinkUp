def reverser
  test = yield
  arr = test.split(' ')
  arr.each_index { |i| arr[i] = arr[i].reverse }
  arr.join(' ')
end

def adder(add = 1)
  yield + add
end

def repeater(repeat = 1)
  repeat.times { yield }
end
