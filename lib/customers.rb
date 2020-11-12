class Customers
    attr_accessor :name, :order

    @@all = []

    def initialize(name)
        @name = name
        @order = []
        @@all << self
    end

    def self.all
        @@all
    end

    def order=(order)
        @order << order
    end

    # def dior
    #     Dior.all.select do |dior|
    #         dior.customer == self
    #     end
    # end

    # def new_order(name, product_type, price, description)
    #     Dior.new(name, product_type, price, description)
    # end
end