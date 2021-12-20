languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}
# max_length={}
# dictionary[:de].length.times do |index|
#   max_length[;
#   parts.each do |i|
#     if i.length > max_length
#       max_length=i.length
#     end
#   end
#   puts max_length
# end
LENGTH=4
lines = languages.map do |key, name|
  numbers = dictionary[key]
  parts = numbers.map { |key, word| ("#{word}" + ' ' * LENGTH)[0,LENGTH] }
  "#{key} #{parts.join(" ")}"
end
puts lines

puts lines.join("\n")