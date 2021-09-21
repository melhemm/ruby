puts "Date:"
date = gets.chomp.to_i

puts "Month"
month = gets.chomp.to_i

puts "year"
year = gets.chomp.to_i

months = {
  January: 31,
  February: 28,
  March: 31,
  April: 30,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October: 31,
  November: 30,
  December: 31,
}

months[:February] = 29 if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)

current_day_number = months.values.take(month - 1).sum + date
puts "#{current_day_number}"