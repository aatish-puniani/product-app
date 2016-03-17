class Product < ActiveRecord::Base
  def sale_message
    if price < 200
      "Discount item!"
    else
      "On Sale"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
