class SomePrice
  def initialize(quantity, imte_price)
    @quantity = quantity
    @item_price = imte_price
  end

  def price
    if base_price > 1000
      discount_factor = 0.95
    else
      discount_factor = 0.98
    end
    base_price * discount_factor
  end

  private

  def base_price
    @quantity * @item_price
  end
end
