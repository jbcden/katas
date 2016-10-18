require './gilded_rule'
class QualityDoublesAfterSellIn < GildedRule
  def update_quality
    if item.sell_in <= 0
      item.quality += 2
    else
      item.quality += 1
    end

    item.quality = normalize_quality(item.quality)
  end
end
