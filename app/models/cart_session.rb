class CartSession
  def initialize(session)
    @session = session
    @session[:cart] ||= []
  end

  def products
    @session[:cart]
  end

  def products_to_list
    array = []
    products.map do |item|
      details = "| Details: #{item['details']}" unless item["details"].nil?
      array << "#{item['product_name']} #{details}| Qty: #{item['qty']}"
    end
    array.join(",")
    return array
  end

  def products_to_string
    array = []
    products.map do |item|
      details = "| Details: #{item['details']}" unless item["details"].nil?
      array << "#{item['product_name']} #{details} | Qty: #{item['qty']}"
    end
    array.join(", ")
  end

  def add_product(product_name, product_id, product_price, qty, options = {})
    options[:ribbon_color] ||= ''
    ribbon_color = options[:ribbon_color]
    product_id = product_id.to_i
    qty = qty.to_i
    cart = @session[:cart]
    product_hash = cart.find { |item| item["product_id"] == product_id && item["ribbon_color"] == ribbon_color }
    if product_hash
      product_hash["qty"] += qty
    else
      cart << { "product_name" => product_name, "product_id" => product_id, "product_price" => product_price, "qty" => qty, "ribbon_color" => ribbon_color }
    end
  end

  def remove_product(product_name, product_id, product_price, qty, details = {})
    product_id = product_id.to_i
    qty = qty.to_i
    details = details[:ribbon_color]
    cart = @session[:cart]
    product_hash = cart.find { |item| item["product_id"] == product_id && item["ribbon_color"] == details }
    if product_hash
      product_hash["qty"] -= qty
    else
    end
    if product_hash && product_hash["qty"] == 0
      @session[:cart].delete(product_hash)
    end
  end

  def empty_cart
    @session[:cart] = []
  end

  def cart_count
    array = @session[:cart].collect { |item| item["qty"] }
    array.sum
  end

  def total
    array = @session[:cart].collect do |p|
      Product.find(p["product_id"]).price * p["qty"]
    end
    total = array.sum
  end

  def tax
    # SC sales tax rate
    (total * 0.06).ceil
  end

  def total_with_tax
    total + tax
  end

  def human_total
    total / 100
  end

  def human_tax
    tax / 100
  end

  def human_total_with_tax
    human_total + human_tax
  end
end
