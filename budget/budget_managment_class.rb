require 'json'
# class Record
#
# end
class User
  def initialize
    if !(File.file?('user.json'))
      puts "What is your name?"
      name = gets.chomp
      puts 'what is your budget?'
      budget = gets.chomp.to_f
      @user = {:name => name, :budget => budget}
      File.open("user.json", "w") do |f|
        f.write(JSON.pretty_generate(@user))
      end
      show_menu
    else
      pp 'file exists'
      file = File.read('user.json')
      @user = JSON.parse(file, :symbolize_names => true)
      puts "Hello #{@user[:name]}! Your budget is #{@user[:budget]}$"
      show_menu
    end
  end
  def show_menu
    puts "*** Current balance: #{@user[:budget]}$ ***
    1) New income
    2) New expanse
    3) Search a record
    4) List all records
  Please enter your choice
  "
    selection = gets.chomp.to_s
    parse(selection)
  end
  def update_budget(amount)
    @user[:budget] += amount
    File.open("user.json", "w") do |f|
      f.write(JSON.pretty_generate(@user))
    end
    pp @user
  end
  def add_income
    puts "What is the amount of your income?"
    income = gets.chomp.to_f
    puts 'Enter description'
    description = gets.chomp.to_s
    update_budget(income)
    if !(File.file?('records.json'))
      record = {
        "records": [{:type => 'income', :description => description, :amount => income}] }
      File.open("records.json", "w") do |f|
        f.write(JSON.pretty_generate(record))
      end
      show_menu
    else
      pp 'file exists'
      file = File.read('records.json')
      array = JSON.parse(file, :symbolize_names => true)
      new_income = {:type => 'income', :description => description, :amount => income}
      array[:records] << new_income
      File.open("records.json", "w") do |f|
        f.write(JSON.pretty_generate(array))
      end
      show_menu
    end
  end
  def add_expanse
    puts "What is the amount of your expanse?"
    expanse = gets.chomp.to_f
    puts 'Enter description'
    description = gets.chomp.to_s
    update_budget(-expanse)
    if !(File.file?('records.json'))
      record = {
        "records": [{:type => 'expanse', :description => description, :amount => expanse}] }
      File.open("records.json", "w") do |f|
        f.write(JSON.pretty_generate(record))
      end
      show_menu
    else
      pp 'file exists'
      file = File.read('records.json')
      array = JSON.parse(file, :symbolize_names => true)
      new_expanse = {:type => 'expanse', :description => description, :amount => expanse}
      array[:records] << new_expanse
      File.open("records.json", "w") do |f|
        f.write(JSON.pretty_generate(array))
      end
      show_menu
    end
  end
  def parse(selection)
    puts selection
    case selection
    when 'menu'
      show_menu
    when '1'
      add_income
    when '2'
      add_expanse
    when '3'
      puts 'should search for record'
    when '4'
    puts 'should list all records'
    when 'exit'
      return
    else
    puts 'illegal choice'
    end
  end
end

one = User.new()

