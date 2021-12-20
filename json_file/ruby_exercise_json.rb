require 'json'
file = File.read('movies.json')
data_hash = JSON.parse(file, :symbolize_names => true)
pp data_hash
data_hash[:results].sort_by! { |hsh| hsh[:vote_average] }
pp 'ascending order########################'
data_hash[:results].each do |hsh|
  puts hsh[:vote_average]
end
data_hash[:results].sort_by! { |hsh| -hsh[:vote_average] }
pp 'Descending Order  order########################'
data_hash[:results].each do |hsh|
  puts hsh[:vote_average]
end
results=data_hash[:results]
# using push
# ------------------------
# selected_results =[];
# results.length.times do |i|
#   selected_results.push({:vered => results[i][:vote_average], :vered_title => results[i][:title] })
# end
# puts '#######################'
# puts selected_results
# all_results = {:sel_results => selected_results, :movies_count => selected_results.length}
# puts '############'
# pp all_results
results.map do |hsh|
  # hsh.reject! { |k| k == :adult }
  hsh[:vered]=hsh[:vote_average]
  hsh[:vered_text]=hsh[:title]
  hsh.select! { |key,i| key == :vered or key == :vered_text}
end
# results.each do |hsh|
#   hsh.select! { |key,i| key == :vered or key == :vered_text}
# end
pp results
all_results = {:sel_results => results, :movies_count => results.length}
puts '############'
pp all_results
# remove results below 6.2
all_results[:sel_results].filter! { |hsh| hsh[:vered] > 6.2 }
all_results[:movies_count]= all_results[:sel_results].length
pp all_results
pp all_results[:sel_results].length