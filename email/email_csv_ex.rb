require "csv"

class Email
  def initialize(subject, header)
    @header = header
    @subject = subject
  end
  def date
    @date = @header[:date]
  end
  def subject
    @subject
  end
  def from
    @from = @header[:from]
  end
end


class EmailsCsvStore
  def initialize(filename)
    @csv_content = CSV.read(filename, headers: true)
    puts @csv_content
  end

  def read
    @csv_content.map do |row|
      row = row.to_hash
      Email.new(row['Subject'], { from: row['From'], date: row['Date'] })
    end
    # @emails =[];
    # (@csv_content.length-1).times do |i|
    #   @emails.push(Email.new(@csv_content[i+1][2], { :from => @csv_content[i+1][1], :date => @csv_content[i+1][0] }),)
    # end
    # return @emails
  end
end

store = EmailsCsvStore.new('emails.csv')
emails = store.read
pp emails
