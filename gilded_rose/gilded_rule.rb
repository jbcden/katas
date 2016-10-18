class GildedRule
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_sell_in
    item.sell_in -= 1
  end

  def update_quality
    item.quality -= 1 if item.sell_in < 0
    item.quality -= 1
    item.quality = normalize_quality(item.quality)
  end

  private

  def normalize_quality(quality)
    if quality <= 0
      0
    elsif quality > 50
      50
    else
      quality
    end
  end
end
