module ApplicationHelper
  def current_customer
    unless session[:customer_id].nil?
      Customer.find(session[:customer_id])
    end
  end
end
