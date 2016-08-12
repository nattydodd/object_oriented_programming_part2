require_relative 'receipt'

class Item

  def initialize(name, type, price, import)
    @name = name
    @type = type
    @price = price
    @import = import
  end

  # def item_type(@type)
  # end


  def add_tax
     if ( @type == "food" || "medical" || "books" ) && ( @import == "false" )
        puts @price
     elsif ( @type == "food" || "medical" || "books" ) && ( @import == "true" )
        puts @price * 1.05
     else
        puts @price * 1.10
    end
  end
end


  # def add_import_tax(@price)
  #   @price * 1.05
  #   return item_w_import_tax
  # end





chocolate = Item.new("chocolate", "food", 1.99, "true")
chocolate.add_tax
