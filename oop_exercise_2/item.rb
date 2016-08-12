# require_relative 'receipt'

class Item

  @@total_price = 0

  def self.total_price
    @@total_price
  end

  def initialize(name, type, price, import)
    @name = name
    @type = type
    @price = price
    @import = import
  end


  def add_tax
     if ( @type == "food" || "medical" || "books" ) && ( @import == "false" )
        puts "#{@name}: $#{@price}"
        @@total_price += @price
     elsif ( @type == "food" || "medical" || "books" ) && ( @import == "true" )
        puts "#{@name}: $#{@price * 1.05}"
        @@total_price += @price
     else
        puts "#{@name}: $#{@price * 1.10}"
        @@total_price += @price
     end
  end

end



chocolate = Item.new("Chocolate", "food", 1.99, "true")
tylenol = Item.new("Tylenol", "medical", 5.00, "false")

chocolate.add_tax
tylenol.add_tax
puts "Sales Tax: "
puts "Total Bill: $#{ Item.total_price }"
