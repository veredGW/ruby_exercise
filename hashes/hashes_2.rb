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

puts dictionary
languages.each do |i, key|
  puts "In #{key}, #{dictionary[i][:one]}"
end

languages_print = languages.select { |key,i| key == :de or key == :es}
puts languages_print
languages_print.each do |i, key|
  a = "In #{key},"
  dictionary[i].each do |english, language|
    a += " #{language} means #{english},"
  end
  puts a
end


