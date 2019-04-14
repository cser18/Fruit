package cn.lf.store.domain;

public class User {
    private String uid;   //用户id
    private String username;  //用户名
    private String password;  //用户密码
    private String email;
    private String telephone;
    private String sex;
    private int state;
    private String addrs;
    private String postcode;
    private String code;   //激活码
    //无参构造函数
    public User() {
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User(String uid, String username, String password, String email, String code) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.email = email;
        this.code = code;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", telphone='" + telephone + '\'' +
                ", sex='" + sex + '\'' +
                ", state=" + state +
                ", addrs='" + addrs + '\'' +
                ", postcode='" + postcode + '\'' +
                ", code='" + code + '\'' +
                '}';
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getAddrs() {
        return addrs;
    }

    public void setAddrs(String addrs) {
        this.addrs = addrs;
    }
}
