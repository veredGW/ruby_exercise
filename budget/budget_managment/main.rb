require './model/model'
require './adapter/adapter_budget.rb'
require 'json'

def add_record(type = 'income',user)
  puts "What is the amount of your "+type + "?"
  amount = gets.chomp.to_f
  puts 'Enter description'
  description = gets.chomp.to_s
  rec = Record.new(type, amount, description)
  user.update_budget(rec)
  Ad.write_record(rec)
end

def print_array_of_rec(array)
  puts 'Found '+ array.length.to_s+ ' records:
-------------------------'
  # pp array
  array.each do |rec|
    puts rec.to_string
  end
end
def list_all_records
  array = Ad.read_records
  print_array_of_rec(array)
end

def search_records
  puts 'Enter search key'
  search_str = gets.chomp.to_s
  array = Ad.read_records
  array.select! {|rec| rec.description.include? search_str}
  print_array_of_rec(array)
end

def parse(selection)
  puts selection
  case selection
  when 'menu'
    return false
  when '1'
    add_record('income', User1)
    return false
  when '2'
    add_record('expanse', User1)
    return false
  when '3'
    search_records
    return false
  when '4'
    list_all_records
    return false
  when 'exit'
    return true
  else
    puts 'illegal choice'
    return true
  end
end

def show_menu(user)
  puts "
  *** Current balance: #{user.budget}$ ***
    1) New income
    2) New expanse
    3) Search a record
    4) List all records
  Please enter your choice
  "
end


################ Main #########################

Ad = Adapter_budget.new("user.json", 'records.json')

# welcome status
if !Ad.check_user_file_exist
      puts "What is your name?"
      name = gets.chomp
      puts 'what is your budget?'
      budget = gets.chomp.to_f
      User1 = User.new(name, budget)
      Ad.write_user(name, budget)
else
      pp 'user file exists'
      user_read = Ad.read_user
      puts "Hello #{user_read[:name]}! Your budget is #{user_read[:budget]}$"
      User1= User.new(user_read[:name],user_read[:budget])
end


exit = false
while !exit
  show_menu(User1)
  selection = gets.chomp.to_s
  exit = parse(selection)
end

Ad.write_user(User1.name, User1.budget)