require './gilded_rule'
class QualityDecreasesLinearlyByTwo < GildedRule
  def update_quality
    if item.sell_in >= 0
      item.quality -= 2
    else
      item.quality -= 4
    end
    item.quality = normalize_quality(item.quality)
  end
end
