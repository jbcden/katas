require './aged_brie'
require './sulfuras'
require './backstage_pass'
require './gilded_rule_factory'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      evolving_item = GildedRuleFactory.create(item)
      evolving_item.update_quality
      evolving_item.update_sell_in
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
