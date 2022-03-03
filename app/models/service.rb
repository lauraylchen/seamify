class Service < ApplicationRecord
  has_many :seamstress_services
  @clothing = ["dress", "t-shirt", "suit", "outerwear", "jeans", "skirt", "wedding dress", "activewear", "childwear", "swimwear"]
  @repairs = ["hemming", "zipper", "elastic", "button", "fitting", "patching"]
  @materials = ["chiffron", "cotton", "crepe", "denim", "lace", "linen", "leather", "polyester","satin", "silk", "suede", "nylon"]
end
