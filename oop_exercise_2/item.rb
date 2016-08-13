
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
     if ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == false )
        puts "1 #{@name} : $#{@price.round(2)}"
        # @@sales_tax
        @@total_price += @price
     elsif ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == true )
        puts "1 #{@name} : $#{ (@price * 1.05).round(2) }"
        @@sales_tax += (@price * 0.05).round(2)
        @@total_price += (@price * 1.05).round(2)
     elsif ( @type != "food" || @type != "medical" || @type != "book" ) && ( @import == true)
        puts "1 #{@name} : $#{ (@price * 1.15).round(2) }"
        @@sales_tax += (@price * 0.15).round(2)
        @@total_price += (@price * 1.15).round(2)
     else
        puts "1 #{@name} : $#{ (@price * 1.10).round(2) }"
        @@sales_tax += (@price * 0.10).round(2)
        @@total_price += (@price * 1.10).round(2)
     end
     
  end


end

#Item List #1

book = Item.new("Book", "book", 12.49, false)
music_cd = Item.new("Music CD", "music", 14.99, false)
chocolate_bar = Item.new("Chocolate Bar", "food", 0.85, false)

book.add_tax
music_cd.add_tax
chocolate_bar.add_tax

puts "Sales Tax: $#{ Item.sales_tax.round(2) }"
puts "Total Bill: $#{ Item.total_price.round(2) }"

#Item List #2
import_choc = Item.new("Imported Chocolate", "food", 10.00, true)
import_perfume = Item.new("Imported Perfume", "perfume", 47.50, true)

import_choc.add_tax
import_perfume.add_tax

puts "Sales Tax: $#{ Item.sales_tax.round(2) }"
puts "Total Bill: $#{ Item.total_price.round(2) }"

#Item List #3
import_perfume2 = Item.new("Imported Perfume", "perfume", 27.99, true)
perfume = Item.new("Perfume", "perfume", 18.99, false)
pills = Item.new("Headache Pills", "medical", 9.75, false)
import_choc2 = Item.new("Imported Chocolate", "food", 11.25, true)

import_perfume2.add_tax
perfume.add_tax
pills.add_tax
import_choc2.add_tax

puts "Sales Tax: $#{ Item.sales_tax.round(2) }"
puts "Total Bill: $#{ Item.total_price.round(2) }"
