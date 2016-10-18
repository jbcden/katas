require './gilded_rule'
class QualityIncreasesUpToSellIn < GildedRule
  def update_quality
    if item.sell_in > 10
      item.quality += 1
    elsif item.sell_in > 5
      item.quality += 2
    elsif item.sell_in > 0
      item.quality += 3
    else
      item.quality = 0
    end
    item.quality = normalize_quality(item.quality)
  end
end
