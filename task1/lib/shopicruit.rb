require 'date'
require 'json'
require 'net/http'

require_relative 'product'

class Shopicruit

  attr_accessor :products, :query

  def self.price_of?(query=nil)
    shopicruit = new(query)
    shopicruit.get_products
    shopicruit.calculate_price
  end

  def self.weight_of?(query=nil)
    shopicruit = new(query)
    shopicruit.get_products
    shopicruit.calculate_weight
  end

  def self.number_of?(query=nil)
    shopicruit = new(query)
    shopicruit.get_products
    shopicruit.calculate_number
  end

  def self.list_of?(query=nil)
    shopicruit = new(query)
    shopicruit.get_products
    shopicruit.get_list
  end

  def initialize(query=nil)
    @products = []
    @query = query
  end

  def query_api
    uri = URI('http://shopicruit.myshopify.com/products.json')
    http_response = Net::HTTP.get(uri)
    JSON.parse(http_response)
  end

  def get_products
    self.query_api["products"].each do |product|
      if @query.nil?
        @products << Product.new(product)
      elsif @query.is_a?(String) && product['product_type'] == @query
        @products << Product.new(product)
      elsif @query.is_a?(Array) && @query.include?(product['product_type'])
        @products << Product.new(product)
      end
    end
    @products
  end

  def calculate_price
    total_price = @products.inject(0) do |sum, product|
      sum += product.variants.inject(0) do |prices, variant|
        prices += variant.price.to_f
      end
    end
    total_price.round(2)
  end

  def calculate_weight
    total_grams = @products.inject(0) do |sum, product|
      sum += product.variants.inject(0) do |grams, variant|
        grams += variant.grams.to_f
      end
    end
    total_grams.round(2)
  end

  def calculate_number
    total_num = @products.inject(0) do |sum, product|
      sum += product.variants.inject(0) do |num, variant|
        num += 1
      end
    end
    total_num.round(2)
  end

  def get_list
    total_list = @products.inject(0) do |list, product|
      list += product.variants.inject(0) do |sublist, variant|
        sublist += variant.title.to_s + "    $" + variant.price.to_s + "    " + variant.grams.to_s + " grams\n"
      end
    end
    total_list.round(2)
  end

end
