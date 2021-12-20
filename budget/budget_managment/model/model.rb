class Record
  attr_accessor :type , :amount, :description
  def initialize(type = 'income',  amount = 0.0, description = '')
    @type = type
    @amount = amount
    @description = description
  end


  def to_string
    if (type == 'income')
      amount_str = @amount
    else
      amount_str =-@amount
    end
    str = @description + ' | ' + amount_str.to_s + ' $'
  end
end

class User
  attr_accessor :name , :budget
  def initialize(name = 'no name', budget = 0.0)
    @name = name
    @budget = budget
  end

  def update_budget(rec)
    if (rec.type == 'income')
      @budget += rec.amount
    else
      @budget -= rec.amount
    end
  end

end