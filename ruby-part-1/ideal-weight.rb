puts "What is your name?"
name = gets.chomp
puts "How tall are you?"
height = gets.chomp.to_i
weight = (height - 110) * 1.15

if weight < 0 
  puts "Ваш вес уже оптимальный"
else
  puts "Имя #{name}, ваш Идеальный вес #{weight}кг"
end  
