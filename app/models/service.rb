class Service < ApplicationRecord
  has_many :seamstress_services
  belongs_to :seamstress, class_name: "User"

  def self.clothings
    return  ["dress", "t-shirt", "suit", "outerwear", "jeans", "skirt", "wedding dress", "activewear", "childwear", "swimwear"]
  end

  def self.repairs
    return  ["hemming", "zipper", "elastic", "button", "fitting", "patching"]
  end

  def self.materials
    return ["chiffron", "cotton", "crepe", "denim", "lace", "linen", "leather", "polyester", "satin", "silk", "suede", "nylon"]
  end

end
