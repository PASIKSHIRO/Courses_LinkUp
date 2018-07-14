class ArrayExtensions
  def sum
    return 0 if self.size.zero?
    sum = 0
    self.each { |e| sum += e }
    sum
  end

  def square
    return [] if self.size.zero?
    squared = []
    self.each_index { |i| squared[i] = self[i]**2 }
    squared
  end
end