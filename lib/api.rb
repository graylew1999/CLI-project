#set up like a class
#resposible for talking with our API    

class Api
    attr_accessor :query

    def initialize(query)
        @query = query
        create_dior
    end

    def fetch_dior
        url = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=dior&product_type=#{@query}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        makeup = JSON.parse(response)
        makeup
    end
   
    def create_dior
        fetch_dior.each do |dior| 
            Dior.new(dior["name"], dior["product_type"], dior["price"], dior["description"])
        end
        end
end
