module HomeHelper
  def search_categories(category)
    raw "<span class='label label-info'>#{category}</span>"
  end
  
  def salary_scale(job)
    raw "#{amount(job.pay_low)} - #{amount(job.pay_heigh)}"
  end
  
  private
  def amount pay
    number_to_currency(pay) if pay != 0
  end
  
end
