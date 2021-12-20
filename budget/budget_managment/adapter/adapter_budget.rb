require 'json'
require '/Users/veredweisz/dev/ruby_ex/budget_managment/model/model'

class Adapter_budget
  attr_accessor :user_file , :records_file
  def initialize( user_file_name= 'user.json',  records_file_name = 'records.json')
    @user_file = user_file_name
    @records_file = records_file_name
  end

  def check_user_file_exist
    return (File.file?(@user_file))
  end

  def check_records_file_exist
    return (File.file?(@records_file))
  end

  def write_user(name, budget)
    user = {:name => name, :budget => budget}
    # pp user
    # pp @user_file
    File.open(@user_file, "w") do |f|
      f.write(JSON.pretty_generate(user))
    end
  end

  def read_user
    file = File.read(@user_file)
    user = JSON.parse(file, :symbolize_names => true)
  end

  def write_record(rec)
    if !(File.file?(@records_file))
      record = {
        "records": [{:type => rec.type, :description => rec.description, :amount => rec.amount}] }
      File.open("records.json", "w") do |f|
        f.write(JSON.pretty_generate(record))
      end
    else
      pp 'record file exists'
      file = File.read(@records_file)
      array = JSON.parse(file, :symbolize_names => true)
      new_income = {:type => rec.type, :description => rec.description, :amount => rec.amount}
      array[:records] << new_income
      File.open(@records_file, "w") do |f|
        f.write(JSON.pretty_generate(array))
      end
    end
  end

  def read_records
    file = File.read(@records_file)
    array = JSON.parse(file, :symbolize_names => true)
    return array[:records].map do |rec|
      rec = Record.new(rec[:type], rec[:amount], rec[:description])
    end
  end
end