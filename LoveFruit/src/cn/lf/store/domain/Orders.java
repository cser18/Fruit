package cn.lf.store.domain;
import java.util.ArrayList;
import java.util.List;

public class Orders {
    private String oid;
    private String ordertime;
    private double total;
    private int state;
    private String address;
    private String name;
    private int telephone;

    //对象与对象有关系 而不是对象和对象的一个属性有关系
    //设计order目的让order携带数据向service进行传递 User可以携带更多的数据
    private User user;

    //知道订单下有那些商品订单
    private List<OrderItem> list = new ArrayList<OrderItem>();

    public Orders() {
    }

    public Orders(String oid, String ordertime, double total, int state, String address, String name, int telephone, User user, List<OrderItem> list) {
        this.oid = oid;
        this.ordertime = ordertime;
        this.total = total;
        this.state = state;
        this.address = address;
        this.name = name;
        this.telephone = telephone;
        this.user = user;
        this.list = list;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderItem> getList() {
        return list;
    }

    public void setList(List<OrderItem> list) {
        this.list = list;
    }

    public int getListLength(){
        return list.size();
    }
}
