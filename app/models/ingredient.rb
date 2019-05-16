class Ingredient < ApplicationRecord
  # before_destroy :check_for_cocktails

  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, uniqueness: true
  validates :name, presence: true

  private

  def check_for_cocktails
    if cocktails.positive?
      # errors.add_to_base('cannot delete ingredient while cocktail exist')
      false
    end
  end
end
