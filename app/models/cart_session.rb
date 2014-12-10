class CartSession
  def initialize(session)
    @session = session
    @session[:cart] ||= []
  end

  def products
    @session[:cart].collect do |h|
      [Product.find(h["product_id"]), h["qty"]]
    end
  end

  def add_product(product_id, qty, options={})
    product_id = product_id.to_i
    qty = qty.to_i
    product_hash = @session[:cart].find { |a| a["product_id"] ==  product_id }
    if product_hash
      product_hash["qty"] += qty
    else
      @session[:cart] << { "product_id" => product_id, "qty" => qty }
    end
  end

  def remove_product(product_id, qty)
    product_id = product_id.to_i
    qty = qty.to_i
    product_hash = @session[:cart].find { |a| a["product_id"] ==  product_id }
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
