class Dior
    attr_accessor :id, :product_type, :colour_name, :description
    @@all = []
    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
        
        @@all << self
    end

    def self.all
        @@all
    end
end