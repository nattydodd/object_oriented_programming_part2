require_relative 'receipt'

class = Item

  def initialize(name, type, price)
    @name = name
    @type = type
    @price = price
  end

  def item_type(@type)
  end


  def add_sales_tax(item)
    case @type
      when @type == "food", "medical", "books" && @import == "false"
        @price
      when @type == "food", "medical", "books" && @import == "true"
        @price * 1.05
      else
        @price * 1.10
      end
    end
  end

  # def add_import_tax(@price)
  #   @price * 1.05
  #   return item_w_import_tax
  # end



end

chocolate = Item.new("chocolate", "food", 1.99)
