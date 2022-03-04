class Service < ApplicationRecord
  has_many :seamstress_services
  belongs_to :seamstress, class_name: "User"

  def self.clothings
    return ['wedding dress', 'suit', 'dress', 'skirt', "t-shirt", "outerwear", "jeans", "activewear", "childwear", "swimwear"]
  end

  def self.repairs
    return ['fitting', 'button', 'zipper', "hemming", "elastic", "patching"]
  end

  def self.materials
    return ['lace', 'suede', 'leather', 'satin', "chiffron", "cotton", "crepe", "denim", "linen", "polyester"]
  end
end
