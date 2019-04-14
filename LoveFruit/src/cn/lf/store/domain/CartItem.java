package cn.lf.store.domain;


/**
 * 抽象出物品模型
 * 1. Product 有pid pname pimage shop_price
 * 2. totalNum  总共数量
 * 3. totalPrice 全部总价
 */
public class CartItem {
    private Product product; //Product 有pid pname pimage shop_price
    private int totalNum;    //totalNum  总共数量
    private Double totalPrice;  //totalPrice 全部总价


    public CartItem() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public Double getTotalPrice() {
        return product.getShop_price() * totalNum;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
