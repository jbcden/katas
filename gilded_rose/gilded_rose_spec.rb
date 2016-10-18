require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "lowers quality by 1" do
      items = [Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "lowers sell_in by 1" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "lowers quality by 2 after sell_in is 0" do
      items = [Item.new("foo", -1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "quality is never negative" do
      items = [Item.new("foo", -1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "increases quality of aged brie" do
      items = [Item.new("Aged Brie", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it "increases quality of aged brie by 2 after sell in" do
      items = [Item.new("Aged Brie", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end

    it "never increases quality over 50" do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "never decreases the quality of sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 30
    end

    it "never decreases the sell in of sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 1
    end

    it "increases the quality of back stage passes by 1 before 10 days" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 31
    end

    it "increases the quality of back stage passes by 2 after 10 days" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 32
    end

    it "increases the quality of back stage passes by 3 after 5 days" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 33
    end

    it "loses all quality of back stage passes after sell in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "lowers quality by 2 for conjured items" do
      items = [Item.new("conjured", 0, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "lowers sell_in by 1" do
      items = [Item.new("conjured", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "lowers quality by 4 after sell_in is 0" do
      items = [Item.new("conjured", -1, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
