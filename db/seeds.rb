Image.create!([
  {url: "http://4d4a0eaf7a6154e26308-b1fe34f25669ea3ec7fe8fe4c1201c10.r0.cf2.rackcdn.com/static/popchips_bag.png", product_id: 1},
  {url: "http://peaklandcoffee.com/product/honestadepommegranateblue1.png", product_id: 2},
  {url: "http://www.artifyme.com.hk/catalog/images/misshug_scarf01c.png", product_id: 3},
  {url: "https://ss7.vzw.com/is/image/VerizonWireless/comparison-page-iphone6s-plus-device?$defaultScale$", product_id: 4},
  {url: "http://www.meghantelpner.com/wp-content/uploads/2012/01/homepage_slide_3-popchips-bags11.png", product_id: 5}
])
Product.create!([
  {name: "Pop Chips", price: "1.59", description: "Our sea salt popchips go best when ripped open during hungry drives home from the grocery store. they also go awesome with water.", inventory: 12, supplier_id: 1, user_id: nil},
  {name: "Pomegranate Blue Honest Tea", price: "3.99", description: "A refreshing mix of pomegranate, grape and blueberry flavors.", inventory: 18, supplier_id: 1, user_id: nil},
  {name: "Tiffany's Scarf", price: "49.99", description: "Tiffany's Scarf!", inventory: 23, supplier_id: 2, user_id: nil},
  {name: "iPhone 6S Plus", price: "749.0", description: "iPhone 6S Plus 64GB", inventory: 145, supplier_id: 3, user_id: nil},
  {name: "Tiffany's Hair Scarf", price: "500.0", description: "ack", inventory: 3, supplier_id: 3, user_id: 1},
  {name: nil, price: nil, description: nil, inventory: nil, supplier_id: nil, user_id: 1}
])
Supplier.create!([
  {name: "The Snack Guys", email: "snackguys@bestsnacksever.com", phone: "555-872-5309"},
  {name: "Price's Scarfs", email: "tiffany@pricemyscarf.com", phone: "415-877-5309"},
  {name: "Apple", email: "apple@apple.com", phone: "888-877-5309"}
])
