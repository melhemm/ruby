fibonacci = [1, 1]
index = 0

loop do
  numb = fibonacci[index] + fibonacci[index + 1]
  break if numb >= 100
  fibonacci << numb
  index += 1
end 

puts fibonacci