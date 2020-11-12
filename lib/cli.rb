#command line interface
# #connect with the user & connect our files together
class Cli
    @@products = ["blush", "bronzer", "eyeliner", "eyeshadow", "foundation", "lipstick", "mascara", "nail_polish"]
    attr_accessor :customer
    
    def start   
        welcome
        input_name
        main
        # choose_product
        # self.display_products
        # initial_input
        # secondary_input
        # all_orders
        # continue_shopping

        # system "clear"
    
    end

    def main
        choose_product
        self.display_products
        initial_input
        secondary_input
        all_orders
        continue_shopping
    end

    # def shopping
    #     choose_product
    #     self.display_products
    #     initial_input
    #     secondary_input
    #     all_orders
    #     continue_shopping
    # end

    def welcome
        puts ""
        puts ""
        puts ""
        puts ":::       ::: :::::::::: :::        ::::::::   ::::::::  ::::    ::::  :::::::::: "
        puts ":+:       :+: :+:        :+:       :+:    :+: :+:    :+: +:+:+: :+:+:+ :+:        "
        puts "+:+       +:+ +:+        +:+       +:+        +:+    +:+ +:+ +:+:+ +:+ +:+        "
        puts "+#+  +:+  +#+ +#++:++#   +#+       +#+        +#+    +:+ +#+  +:+  +#+ +#++:++#   "
        puts "+#+ +#+#+ +#+ +#+        +#+       +#+        +#+    +#+ +#+       +#+ +#+        "
        puts " #+#+# #+#+#  #+#        #+#       #+#    #+# #+#    #+# #+#       #+# #+#        "
        puts "  ###   ###   ########## ########## ########   ########  ###       ### ########## "
        puts ""
        puts ""
        puts ""
    end

    def input_name
        puts "========================================================"
        puts "                                                        "
        puts "             Discover the world of Dior!"
        puts "               Please enter your name "
        puts "                                                        "
        puts "========================================================"
        input = gets.strip.upcase
        @customer = Customers.new(input)
        system "clear"
        puts "========================================================"
        puts "                     HELLO #{input}!                    "
        puts "========================================================"

    end

    def choose_product 
        puts "                                                        "       
        puts "   Please choose products as below (Type number 1 - 8)  "
        puts "                                                        "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def initial_input
        input = gets.strip.to_i
        index = input_to_index(input)

        if index.between?(0,7)
            @@products.each.with_index do |product, i|
                if index == i
                    Api.new( product )
                    view_by_product_type( product )
                end
            end
            
        else 
            puts "Uh oh!!!"
            puts "We're sorry to say but we don't have the product that you were asking."
            puts "Pleas try again! ( Type number 1 - 8)" 
            initial_input
           
        end
        
    end

    def view_by_product_type(query)
        system "clear"
        puts "                                                        "
        puts "             Here are #{query} products." 
        puts "  Please enjoy your shoping and choose name of product! "
        puts "                                                        "
        puts "========================================================"
        
        Dior.all.each_with_index do |query, index| 
        puts ""
        puts "#{index+1}.  #{query.name.capitalize.strip}"
        puts "    Price (£):   #{query.price.capitalize}"
        puts "    Description: #{query.description.capitalize}"
        end
    end


    def secondary_input
        input = gets.strip.to_i
        index = input_to_index(input)
        if input.between?(0, Dior.all.size)
        Dior.all.each.with_index do |product, i|
                if index == i
                    @customer.order=( product )
                    puts ""
                    puts "Thank you for shopping with us! #{@customer.name}"
                    puts "          ---------------             "
                    puts ""
                    puts "Your order details"
                    puts ""
                    puts "Product Type: #{product.product_type}"
                    puts "Product:      #{product.name}"
                    puts "Price (£):    #{product.price}"
                    
                    
                end
            end    
        else 
            puts ""
            puts "                          Uh Oh!!!                                    "
            puts "We're sorry to say but we don't have the product that you were asking."
            puts "Pleas try again! ( Please type number )                 " 
            puts ""
            secondary_input
        end
        # system "clear"
    end

    def continue_shopping
        puts "                                 "
        puts "Do you want to continue shopping? "
        puts " y - to continue shopping  OR  exit - to terminate the program"
        input = gets.strip
        if input == "y"
        main
        elsif input == "exit"
            exit
        else
            puts "Please try again!"
            continue_shopping
            system "clear"
        end
       
    end
     
    def all_orders
        puts "Your orders as below"
        puts 
        @customer.order.each_with_index {|order, index|
            puts "#{index+1}. #{order.name}"}
        
    end

    def exit
        at_exit do 
            exit 0
          end
        puts "We are sad to see you go"
        sleep(1)
        puts "3"
        sleep(1)
        puts "2"
        sleep(1)
        puts "1"
        system "clear"
        
    end

    def self.products
        @@products
    end

    def self.all
        @@all
    end

    def display_products
        Cli.products.each_with_index{|product, index| 
        puts "#{index+1}. #{product.capitalize}"}
    end

end




    