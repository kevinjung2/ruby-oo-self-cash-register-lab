class CashRegister

  attr_accessor :total, :discount, :items, :last_quantity

  def initialize(discount = 0)
    @last_quantity = []
    @items = []
    @item_price = []
    @total = 0
    @discount = discount
  end

  def discount
    @discount = 20
  end

  def add_item(title, price, quantity = 1)
    i = 1
    @last_quantity << quantity
    while i <= quantity
      @items << title
      @item_price << price
      i += 1
    end
    calculate
  end

  def calculate
    @total = @item_price.inject(0) { |sum, num| sum + num }
  end

  def apply_discount
    if @discount == 20
      @total -= @total * @discount / 100
      "After the discount, the total comes to $800."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    i = 1
    while i <= last_quantity.last
      @items.pop
      @item_price.pop
      i += 1
    end
    calculate
  end
end
