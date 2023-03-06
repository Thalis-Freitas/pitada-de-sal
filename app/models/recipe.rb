class Recipe < ApplicationRecord
  belongs_to :category
  before_validation :set_post_date, on: :create
  validates :name, :preparation_time, :portions, :ingredients, :instructions, presence: true
  validates :preparation_time, :portions, comparison: { greater_than: 0 }

  private

  def set_post_date
    self.post_date = Time.zone.today
  end
end
