vowels = ["A", "E", "I", "O", "U"]
hash = Hash.new
("A".."Z").each_with_index do |key, index|
  if vowels.include?(key)
    hash[key.to_sym] = index + 1
  end
end

puts hash