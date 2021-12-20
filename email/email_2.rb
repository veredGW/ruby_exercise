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


email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })
puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"