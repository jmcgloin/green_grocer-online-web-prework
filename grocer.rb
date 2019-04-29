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
    if cart[item] != nil
      count = cart[coupon[:item]][:count]
      num = coupon[:num]
      cost = coupon[:cost]
      if count >= num
        new_item = item + " W/COUPON"
        cart[new_item] = {}
        cart[new_item][:clearance] = cart[item][:clearance]
        cart[new_item][:price] = cost
        cart[new_item][:count] = (count - count  % num) / num
        cart[item][:count] = count % num
      end
    end
  end
  cart
  # binding.pry
end

def apply_clearance(cart)
  cart.keys.each do
    |item|
    cart[item][:price] = cart[item][:clearance] ? (0.8 * cart[item][:price]).round(2) : cart[item][:price]
    # binding.pry
  end
  cart
end

def checkout(cart, coupons)
  final_cart = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
  total = 0
  cart.each do
    |item|
    binding.pry
    qty = cart[item][:count]
    each = cart[item][:price]
    total += qty * each
  end
  total
end
