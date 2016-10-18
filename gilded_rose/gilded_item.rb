class GildedItem < Item

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
