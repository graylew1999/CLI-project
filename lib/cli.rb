#command line interface
# #connect with the user & connect our files together
class Cli 

    @@products = ["blush", "bronzer", "eyeliner", "eyeshadow", "foundation", "lipstick", "mascara", "nail_polish"]
    attr_accessor :customer
    
    def start   
        welcome
        input_name
        main
        
    end

    def main
        choose_product
        self.display_products
        initial_input
        secondary_input
        all_orders
        continue_shopping
        
    end

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
        puts "================================================================================="
        puts " "
        puts "                           Discover the world of Dior!"
        puts "                             Please enter your name "
        puts " "
        puts "================================================================================="
        input = gets.strip.upcase
        @customer = Customers.new(input)
        system "clear"
        puts "================================================================================="
        puts  ""
        puts "                                HELLO #{input}!"
        puts  ""
        puts "================================================================================="

    end

    def choose_product 
        puts ""      
        puts "Which of these products interst you?" 
        puts "(Please type number '1 - 8' or '9' to terminate the program)\n"
        puts "" 
                                                               
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def initial_input
        input = gets.strip.to_i
        index = input_to_index(input)
        
        if index.between?(0,7)
           @@products.select.with_index do |product, i|
                if index == i
                    Dior.all.clear
                    Api.new( product )
                    view_by_product_type ( product )
                end
               
            end

        elsif input == 9
            exit
            
        else 
            puts ""
            puts "Uh oh!!!"
            puts "We're sorry but this is not a valid response."
            puts "Pleas try again! ( Type number '1 - 8' or '9' to terminate the program)" 
            puts ""
            initial_input
            
        end
    end
   
   
    def view_by_product_type(product)
        
        puts "================================================================================="
        puts " "
        puts "                     Here are the #{product} products." 
        puts "                         Enjoy your shopping!"
        puts "      Please type number of the product you would like to add to your cart"
        puts "                   Type '100' - to terminate the program"
        puts " "
        puts "================================================================================="
            
        Dior.all.select.with_index do |product, index| 
        puts "\n#{index+1}. #{product.name.capitalize.strip}"
        puts "Price (£):   #{product.price.capitalize.strip}"
        puts "Description:\n#{product.description.capitalize.strip}\n"
        
        end
    
    end


    def secondary_input
        input = gets.strip.to_i
        index = input_to_index(input)
        if index.between?(0, Dior.all.size)
        Dior.all.each.with_index do |product, i|
                if index == i 
                    @customer.order=( product )
                    puts "========================================================================"
                    puts "\n#{@customer.name}, Product has been added to your cart.\n "
                    puts "Product details:\n"
                    puts "Product Type: #{product.product_type.strip}"
                    puts "Product:      #{product.name.strip}"
                    puts "Price (£):    #{product.price.strip}"
                end
                
                
            end
        elsif input == 100
            exit
        
        else
            puts "\nUh oh!!!"
            puts "We're sorry but this is not a valid response."
            puts "Pleas try again! ( Type number or '100' to terminate the program )\n" 
            secondary_input
        end
      
    end

    def continue_shopping
        puts "\n========================================================================"
        puts "\nDo you want to continue shopping? "
        puts "\nType 'yes'      - to continue shopping"  
        puts "Type 'no'       - to terminate the program"
        puts "Type 'checkout' - to checkout your cart\n"
        input = gets.strip
        system "clear"
        if input == "yes"
            main

        elsif input == "no"
            exit
        
        elsif input == "checkout"
            checkout
        
        else
            # puts ""
            puts "\nWe're sorry but this is not a valid response."
            puts "Please try again!\n"
            continue_shopping
        end
        
    end
     
    def all_orders
        puts "\n========================================================================\n"
        puts "\nYour shopping cart:\n "

        @customer.order.each_with_index {|order, index|
        puts "Product: #{index+1}. #{order.name.strip}\n"}
    end
    
    def checkout
        puts "\nThank you for shopping with us!"
        puts "Your order will be delivered soon.\n"
        puts "Your window will automatically close in 10 seconds!\n"
        @customer.order.each_with_index do |order, index|
            puts "#{index+1}. Product: #{order.name.strip}"
            puts "   Product Type: #{order.product_type.strip}"
            puts "   Price (£):    #{order.price.strip}"
            puts ""
        end
         sleep(10)
         system "clear"
         Kernel.exit
    end

    def exit
        puts "\nWe are sad to see you go!\n"
        sleep(1)
        puts "\n3!\n"
        sleep(1)
        puts "\n2!\n"
        sleep(1)
        puts "\n1!\n"
        system "clear"
        Kernel.exit
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




    