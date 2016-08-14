# require_relative 'receipt'

class Item

  attr_reader :name
  attr_reader :price
  attr_accessor :total_price

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
        # puts "1 #{@name} : $#{@price.round(2)}"
        @@sales_tax
        @@total_price += @price
        @price.round(2)
     elsif ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == true )
        # puts "1 #{@name} : $#{ (@price * 1.05).round(2) }"
        @@sales_tax += (@price * 0.05).round(2)
        @@total_price += (@price * 1.05).round(2)
        (@price * 1.05).round(2)
     elsif ( @type != "food" || @type != "medical" || @type != "book" ) && ( @import == true)
        # puts "1 #{@name} : $#{ (@price * 1.15).round(2) }"
        @@sales_tax += (@price * 0.15).round(2)
        @@total_price += (@price * 1.15).round(2)
        (@price * 1.15).round(2)
     else
        # puts "1 #{@name} : $#{ (@price * 1.10).round(2) }"
        @@sales_tax += (@price * 0.10).round(2)
        @@total_price += (@price * 1.10).round(2)
        (@price * 1.10).round(2)
     end

  end

  # def calc_sales_tax
  #   if ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == false )
  #      @@sales_tax
  #      puts "Sales tax: #{ @@sales_tax }"
  #   elsif ( @type == "food" || @type == "medical" || @type == "book" ) && ( @import == true )
  #      puts "Sales tax: #{ @@sales_tax += (@price * 0.05).round(2) }"
  #   elsif ( @type != "food" || @type != "medical" || @type != "book" ) && ( @import == true )
  #      puts "Sales tax: #{ @@sales_tax += (@price * 0.15).round(2) }"
  #   else
  #      puts "Sales tax: #{@@sales_tax += (@price * 0.10).round(2) }"
  #   end
  # end

end

#Item List #1
#*******************************************


book = Item.new("Book", "book", 12.49, false)
music_cd = Item.new("Music CD", "music", 14.99, false)
chocolate_bar = Item.new("Chocolate Bar", "food", 0.85, false)


#Would like to make this universal, instead of having to call each item seperately
item_list1 = {
  book.name => book.add_tax,
  music_cd.name => music_cd.add_tax,
  chocolate_bar.name => chocolate_bar.add_tax
}


class Receipt

  def initialize(item_list)
    @item_list = item_list
  end

  def print_items
    @item_list.each do |item, price|
    puts "1 #{item} : $#{price}"
    end
  end

end

receipt1 = Receipt.new(item_list1)

receipt1.print_items

puts "Sales Tax: $#{ Item.sales_tax }"
puts "Total Bill: $#{ Item.total_price }"
