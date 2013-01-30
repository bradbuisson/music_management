class Show < ActiveRecord::Base
  attr_accessible :date, :time, :venue, :address, :price

  validates_numericality_of :price, allow_nil: true

  before_save :check_price

  default_scope order: 'created_at DESC'

  def price_for_show
    if price.nil?
      "Free!"
    else
      "$#{price}"
    end
  end

private

  def check_price
    if self.price == 0
      self.price = nil
    end
  end
end
