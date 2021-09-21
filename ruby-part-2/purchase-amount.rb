cart = Hash.new
to_pay = 0

loop do
  puts "Product Name"
  product_name = gets.chomp

  break if product_name == "Stop"

  puts "Product quantity"
  product_quantity = gets.chomp.to_f

  puts "Product Price"
  product_price = gets.chomp.to_f

  cart[product_name.to_sym] = {price: product_price, quantity: product_quantity}
end

cart.each do |key, value|
  single_product = (value[:price] * value[:quantity]).round(2)
  to_pay += single_product
  puts "#{key}: #{value} sum for single product: #{single_product}"
end

puts "Total to pay: #{to_pay}"