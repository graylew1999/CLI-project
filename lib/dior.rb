class Dior
    attr_accessor :name, :product_type, :price, :description 
    @@all = []
     def initialize(name, product_type, price, description)
        @name = name
        @product_type = product_type 
        @price = price
        @description = description
        @@all << self #auto save
    end

    def self.all
        @@all
    end
end