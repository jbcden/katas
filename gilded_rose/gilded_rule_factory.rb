require './quality_decreases_linearly_by_one'
require './quality_decreases_linearly_by_two'
class GildedRuleFactory
  def self.create(item)
      case item.name
      when 'Aged Brie'
        QualityDoublesAfterSellIn.new(item)
      when 'Sulfuras, Hand of Ragnaros'
        QualityNeverChanges.new(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        QualityIncreasesUpToSellIn.new(item)
      when 'conjured'
        QualityDecreasesLinearlyByTwo.new(item)
      else
        QualityDecreasesLinearlyByOne.new(item)
      end
  end
end
