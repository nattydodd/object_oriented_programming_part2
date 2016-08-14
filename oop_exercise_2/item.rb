require_relative 'receipt'

class Item

  attr_reader :name
  attr_reader :price

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
        # no @@sales_tax added
        @@total_price += @price
        @price.round(2)
     elsif ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == true )
        @@sales_tax += (@price * 0.05).round(2)
        @@total_price += (@price * 1.05).round(2)
        (@price * 1.05).round(2)
     elsif ( @type != "food" || @type != "medical" || @type != "book" ) && ( @import == true)
        @@sales_tax += (@price * 0.15).round(2)
        @@total_price += (@price * 1.15).round(2)
        (@price * 1.15).round(2)
     else
        @@sales_tax += (@price * 0.10).round(2)
        @@total_price += (@price * 1.10).round(2)
        (@price * 1.10).round(2)
     end
  end

end


#Shopping List #1
#*******************************************


book = Item.new("Book", "book", 12.49, false)
music_cd = Item.new("Music CD", "music", 14.99, false)
chocolate_bar = Item.new("Chocolate Bar", "food", 0.85, false)

item_list1 = {
  book.name => book.add_tax,
  music_cd.name => music_cd.add_tax,
  chocolate_bar.name => chocolate_bar.add_tax
}
#^^^Would like to make this universal, instead of having to call each item seperately

receipt1 = Receipt.new(item_list1)

#Printing Receipt 1
receipt1.print_items

puts "Sales Tax: $#{ Item.sales_tax }"
puts "Total Bill: $#{ Item.total_price }"

# Shopping List 2
# ****************************************************


import_choc = Item.new("Imported Chocolate", "food", 10.00, true)
import_perfume = Item.new("Imported Perfume", "perfume", 47.50, true)

item_list2 = {
  import_choc.name => import_choc.add_tax,
  import_perfume.name => import_perfume.add_tax,
}


receipt2 = Receipt.new(item_list2)

#Printing Receipt 2
receipt2.print_items

puts "Sales Tax: $#{ Item.sales_tax }"
puts "Total Bill: $#{ Item.total_price }"

# Shopping List 3
# ******************************************


import_perfume2 = Item.new("Imported Perfume", "perfume", 27.99, true)
perfume = Item.new("Perfume", "perfume", 18.99, false)
pills = Item.new("Headache Pills", "medical", 9.75, false)
import_choc2 = Item.new("Imported Chocolate", "food", 11.25, true)

item_list3 = {
  import_perfume2.name => import_perfume2.add_tax,
  perfume.name => perfume.add_tax,
  pills.name => pills.add_tax,
  import_choc2.name => import_choc2.add_tax
}

receipt3 = Receipt.new(item_list3)

#Printing Receipt 3
receipt3.print_items

puts "Sales Tax: $#{ Item.sales_tax }"
puts "Total Bill: $#{ Item.total_price }"

#Notes: Sales & Total tax is cumulative for all bills if code is ran together
## numbers are not rounding to the nearest 5
##
