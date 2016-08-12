
class Item

  @@total_price = 0
  @@sales_tax = 0

  def self.total_price
    @@total_price
  end

  def self.sales_tax
    @@sales_tax
  end

  def initialize(name, type, price, import)
    @name = name
    @type = type
    @price = price
    @import = import
  end


  def add_tax
     if ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == "false" )
        puts "1 #{@name} : $#{@price.round(2)}"
        # @@sales_tax
        @@total_price += @price
     elsif ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == "true" )
        puts "1 #{@name} : $#{ (@price * 1.05).round(2) }"
        @@sales_tax += (@price * 0.05).round(2)
        @@total_price += (@price * 1.05).round(2)
     elsif ( @type != "food" || @type != "medical" || @type != "book" ) && ( @import == "true")
        puts "1#{@name} : $#{ (@price * 1.15).round(2) }"
        @@sales_tax += (@price * 0.15).round(2)
        @@total_price += (@price * 1.15).round(2)
     else
        puts "1#{@name} : $#{ (@price * 1.10).round(2) }"
        @@sales_tax += (@price * 0.10).round(2)
        @@total_price += (@price * 1.10).round(2)
     end
  end


end

#Item List #1

book = Item.new("Book", "book", 12.49, "false")
music_cd = Item.new("Music CD", "music", 14.99, "false")
chocolate_bar = Item.new("Chocolate Bar", "food", 0.85, "false")
# chocolate = Item.new("Chocolate", "food", 1.99, "true")
# tylenol = Item.new("Tylenol", "medical", 5.00, "false")

# chocolate.add_tax
# tylenol.add_tax
# #
book.add_tax
music_cd.add_tax
chocolate_bar.add_tax

puts "Sales Tax: $#{ Item.sales_tax }"
puts "Total Bill: $#{ Item.total_price }"
