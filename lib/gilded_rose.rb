class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|

      if item.name == "Sulfuras, Hand of Ragnaros"
        next

      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"

        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in <= 5
          item = increase_item_quality(item, 3)
        elsif item.sell_in <= 10
          item = increase_item_quality(item, 2)
        else
          item = increase_item_quality(item, 1)
        end

      elsif item.name == "Aged Brie"

        item = increase_item_quality(item, 1)

      elsif item.name == "Conjured"

        item = decrease_item_quality(item, 2)

      elsif

        item = decrease_item_quality(item, 1)

      end

      item.sell_in -= 1

    end
  end

  def increase_item_quality( item, increaseValue )
    
    if item.quality < 50
      item.quality += increaseValue
    end

    return item
  end

  def decrease_item_quality( item, decreaseValue )
    
    return item if item.quality <= 0
    
    if item.sell_in <= 0
      item.quality -= decreaseValue * 2
    else
      item.quality -= decreaseValue
    end

    return item
  end

end
