package cn.lf.store.domain;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * 抽象的购物车模型
 * 属性:
 * 1. 全部价格
 * 2. 可以存放物品的容器 （map）
 * 方法:
 * 1. 添加购物车
 * 2. 删除购物车
 * 3. 清空购物车
 */
public class Cart {
    private Double totalPrice = 0.0; //全部价格
    private Map<String, CartItem> map = new HashMap<String, CartItem>();
    private int Num;
    /**
     * 1.存在
     * 2.不存在
     *
     * @param cartItem
     */
    //1.添加购物车
    public void addCartItemToCart(CartItem cartItem) {
        String pid = cartItem.getProduct().getPid();
        if (map.containsKey(pid)) {
            //存在
            CartItem oldItem = map.get(pid);
            oldItem.setTotalNum(cartItem.getTotalNum() + oldItem.getTotalNum());
        } else {
            map.put(pid, cartItem);
            Num+=1;
        }
    }

    //2.删除物品
    public void removeCartItem(String pid) {
        map.remove(pid);
    }

    //3.清空购物车
    public void clearCart() {
        map.clear();
    }

    public Double getTotalPrice() {
        totalPrice = 0.0;
        Collection<CartItem> collections = map.values();
        for (CartItem cartItem : collections) {
            totalPrice += cartItem.getTotalPrice();
        }
        return totalPrice;
    }

    /**
     * 判断是否有map
     *
     * @param
     */
    public Collection<CartItem> getCartItems() {
        return map.values();
    }


    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Map<String, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    public Cart() {
        Num = 0;
    }

    public int getNum() {
        return Num;
    }

    public void setNum(int num) {
        Num = num;
    }
}
