class Email
  def initialize(subject, date, from)
    @date = date
    @subject = subject
    @from = from
  end
  def date
    @date
  end
  def subject
    @subject
  end
  def from
    @from
  end
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"