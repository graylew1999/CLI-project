#set up like a class
#resposible for talking with our API    
class API
    def self.run
        # puts "Discover the world of Dior!"
        # puts "Please choose products as below"
        input = gets.chomp
        url ="http://makeup-api.herokuapp.com/api/v1/products.json?brand=covergirl&product_type=#{input}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        binding.pry
        #formatted_response = JSON.parse(response)
        

        
        
    end
end
