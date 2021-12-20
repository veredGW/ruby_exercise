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

lines = languages.map do |key, name|
  numbers = dictionary[key]
  parts = numbers.map { |key, word| "#{word}" }
  "#{key} #{parts.join(" ")}."
end

puts lines.join("\n")