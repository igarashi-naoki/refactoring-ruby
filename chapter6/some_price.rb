class SomePrice
  def initialize(quantity, imte_price)
    @quantity = quantity
    @item_price = imte_price
  end

  def price
    base_price * discount_factor
  end

  private

  def base_price
    @quantity * @item_price
  end

  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end
