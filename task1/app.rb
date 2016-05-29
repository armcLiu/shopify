require_relative 'lib/shopicruit'

cnumber = Shopicruit.number_of? ["Computer"]
knumber = Shopicruit.number_of? ["Keyboard"]

puts "There are #{cnumber} Computers in the Shopicruit store"
puts "There are #{knumber} Keyboard in the Shopicruit store"

cprice = Shopicruit.price_of? ["Computer"]
kprice = Shopicruit.price_of? ["Computer"]
price = cprice + (kprice * cnumber)

cweight = Shopicruit.weight_of? ["Computer"]
kweight = Shopicruit.weight_of? ["Computer"]
weight = cweight + (kweight * cnumber)

puts "No duplicate combines: "
puts "The total price is $#{price}"
puts "The total weight is #{weight} grams"


cprice = Shopicruit.lprice_of? ["Computer"]
price = cprice + kprice

cweight = Shopicruit.lpweight_of? ["Computer"]
weight = cweight + kweight

puts "No duplicate variants: "
puts "The total price is $#{price}"
puts "The total weight is #{weight} grams"
