class Service < ApplicationRecord
  has_many :seamstress_services
  belongs_to :seamstress, class_name: "User"

  def self.clothings
    return ['Wedding Dress', 'Suit', 'Dress', 'Skirt', "T-Shirt", "Outerwear", "Jeans", "Activewear", "Childwear", "Swimwear"]
  end

  def self.repairs
    return ['Fitting', 'Button', 'Zipper', "Hemming", "Elastic", "Patching"]
  end

  def self.materials
    return ['Lace', 'Suede', 'Leather', 'Satin', "Chiffon", "Cotton", "Crêpe", "Denim", "Linen", "Polyester"]
  end
end
