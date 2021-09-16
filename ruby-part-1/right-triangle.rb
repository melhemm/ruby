puts "Enter altitude"
altitude = gets.to_i ** 2

puts "Enter base"
base = gets.to_i ** 2

puts "Enter hypotenuse"
hypotenuse = gets.to_i ** 2

sum = altitude + base

if sum == hypotenuse 
  puts "треугольник равнобедренный и равносторонний.
  altitude: #{altitude}, 
  base: #{base}, 
  sum: #{sum},
  hypotenuse: #{hypotenuse}
  "
else 
  puts "Не треугольник.
  altitude: #{altitude}, 
  base: #{base}, 
  sum: #{sum},
  hypotenuse: #{hypotenuse}"
end