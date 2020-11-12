class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true
  before_destroy :check_for_cocktails

  def check_for_cocktails
    return unless cocktails.count.positive?
    errors.add_to_base('Cannot delete an ingredient which is used in a cocktail!')
    false
  end
end
