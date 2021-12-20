def add_three(number)
  return number + 3
  number + 4
  return number
end

returned_value = add_three(4)
puts returned_value


puts "hello world"
puts "What is your name?"
name = gets.chomp
puts 'what is your last name?'
last = gets.chomp
puts "Hello " + name +' '+last
puts "how old are you?"
age = gets.chomp.to_i

puts age+10

10.times {puts name}