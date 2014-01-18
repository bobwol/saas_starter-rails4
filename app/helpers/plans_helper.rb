module PlansHelper
  def pricing_table_class plan, plans
    if plan.is_featured?
      class_name = [class_name, 'featured'].join(' ')
    end
    
    if plan == plans.first
      class_name = [class_name, 'first'].join(' ')
    elsif plan == plans.last
      class_name = [class_name, 'last'].join(' ')
    end
    
    class_name
  end
end
