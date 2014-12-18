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
      ribbon_color = "| Ribbon Color: #{item['ribbon_color']}" unless item["ribbon_color"].nil?
      array << "#{item['product_name']} #{ribbon_color} | Qty: #{item['qty']}"
    end
    array.join(",")
    return array
  end

  def products_to_string
    array = []
    products.map do |item|
      ribbon_color = "| Ribbon Color: #{item['ribbon_color']}" unless item["ribbon_color"].nil?
      array << "#{item['product_name']} #{ribbon_color} | Qty: #{item['qty']}"
    end
    array.join(", ")
  end

  def add_product(product_name, product_id, product_price, qty, options = {})
    # assign arguments to variables
    product_id = product_id.to_i
    qty = qty.to_i
    # assign options if they exist
    ribbon_color = options[:ribbon_color]
    # create product hash variable from existing cart session
    cart = @session[:cart]
    product_hash = cart.find { |item| item["product_id"] == product_id && item["ribbon_color"] == ribbon_color }
    # if cart has the product with the same ribbon color already, add to its quantity
    if product_hash
      product_hash["qty"] += qty
    # otherwise create a cart item with the parameters
    else
      @session[:cart] << { "product_name" => product_name, "product_id" => product_id, "product_price" => product_price, "qty" => qty, "ribbon_color" => ribbon_color }
    end
  end

  def remove_product(product_name, product_id, product_price, qty, options = {})
    product_id = product_id.to_i
    qty = qty.to_i
    ribbon_color = options[:ribbon_color]
    cart = @session[:cart]
    product_hash = cart.find { |item| item["product_id"] == product_id && item["ribbon_color"] == ribbon_color }
    if product_hash
      product_hash["qty"] -= qty
    else
    end
    if product_hash["qty"] == 0
      @session[:cart].delete(product_hash)
    end
  end

  def empty_cart
    @session[:cart] = []
  end

  def total
    array = @session[:cart].collect do |p|
      Product.find(p["product_id"]).price * p["qty"]
    end
    array.sum
  end

  def cart_count
    array = @session[:cart].collect { |item| item["qty"] }
    array.sum
  end

  def human_total
    total / 100
  end
end
