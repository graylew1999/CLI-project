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

end