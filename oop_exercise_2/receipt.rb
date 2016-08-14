
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
