<<<<<<< HEAD
#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title:       "My Book Title",
      description: "yyy",
      image_url:   "zzz.jpg"
    )
    product.price = -1
    assert product.invalid?
    assert_equal ["price must be setted", "price must be in a valid CHF format (only 0.05 steps are supported)"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["price must be setted"], 
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title:       "My Book Title",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end
  
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end
  
  test "price must be in 0.05 steps" do
    product = products(:shitprice)
    
    assert product.invalid?
    assert_equal ["price must be in a valid CHF format (only 0.05 steps are supported)"],
      product.errors[:price]
      
    assert product.errors[:price].any?
    
    product.price = 20.05
    assert product.valid?
    
  end
  
end
=======
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
>>>>>>> f74dafc0b303851eba233fb9d32a9e8da904b9ac
