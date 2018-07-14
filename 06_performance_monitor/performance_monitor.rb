def measure(repeats = 1)
  start = Time.now
  repeats.times { yield }
  runtime = Time.now - start
  runtime / repeats
end
