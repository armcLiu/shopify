require_relative 'lib/shopicruit'

cnumber = Shopicruit.number_of? ["Computer"]

#clist = Shopicruit.list_of? ["Computer"]

knumber = Shopicruit.number_of? ["Keyboard"]

price = Shopicruit.price_of? ["Computer"]

weight = Shopicruit.weight_of? ["Computer"]

puts "There are #{cnumber} Computers in the Shopicruit store"
#puts clist
puts "There are #{knumber} Keyboard in the Shopicruit store"
puts "The total price of all Computer in the Shopicruit store is $#{price}"
puts "The total weight of all Computer in the Shopicruit store is #{weight} grams"
