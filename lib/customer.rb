class Customer
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

    # def orders
    #     Order.all.select{|order| order.customer == self}
    # end
    def order=(order)
        @order << order
    end

  
end