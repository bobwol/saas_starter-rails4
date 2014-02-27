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
  
  def price_cta plan
    price = "(#{number_to_currency plan.price}/#{plan.interval})"
    price = "<del>#{price}</del> <span class=\"trial\">Free trial - limited time only!</span>" if plan.has_trial? && !current_user
    price = "(FREE!)" if plan.price == 0
    price
  end
end
