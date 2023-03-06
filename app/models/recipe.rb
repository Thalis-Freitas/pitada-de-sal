class Recipe < ApplicationRecord
  before_validation :set_post_date, on: :create

  private

  def set_post_date
    self.post_date = Time.zone.today
  end
end
