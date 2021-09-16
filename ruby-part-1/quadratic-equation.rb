puts "Введите коэффициенты для уравнения a: "
a = gets.chomp.to_i

puts "Введите коэффициенты для уравнения b: "
b = gets.chomp.to_i

puts "Введите коэффициенты для уравнения c: "
c = gets.chomp.to_i

discr = b ** 2 - 4 * a * c

if discr > 0
  x1 = (-b + Math.sqrt(discr)) / 2 * a
  x2 = (-b - Math.sqrt(discr)) / 2 * a
  puts "Дискриминант = #{discr}, x1 = #{x1}, x2 = #{x2}"
elsif discr == 0
  x = -b / (2 * a)
  puts "Дискриминант = #{discr}, x1 = x2 = #{x}"
else
  puts "#{discr}, Корней нет"
end