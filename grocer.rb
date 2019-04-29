require  'pry'
def consolidate_cart(cart)
  cons_cart = {}
  cart.each do
    |item|
    if !cons_cart.key?(item.keys[0])
      cons_cart[item.keys[0]] = item.values[0]
      cons_cart[item.keys[0]][:count] = 1
    else
      cons_cart[item.keys[0]][:count] += 1
    end
      
  end
  cons_cart
end

def apply_coupons(cart, coupons)
  coupons.each do
    |coupon|
    item = coupon[:item]
    count = cart[coupon[:item][:count]]
    num = coupon[:num]
    cost = coupon[:cost]
    if cart[item] != nil && count >= num
      cart[item << " W/COUPON"] = cart[item]
      cart[item << " W/COUPON"][:price] = cost
      cart[item << " W/COUPON"][:count] = 
  binding.pry
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
