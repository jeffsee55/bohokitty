module ApplicationHelper
  def current_customer
    if session[:customer_id]
      Customer.find(session[:customer_id])
    else
      Customer.find(9)
    end
  end
end
