package cn.lf.store.domain;

public class Root {
    private String adminName;
    private String adminPassWord;

    public Root() {
    }

    public Root(String adminName, String adminPassWord) {
        this.adminName = adminName;
        this.adminPassWord = adminPassWord;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassWord() {
        return adminPassWord;
    }

    public void setAdminPassWord(String adminPassWord) {
        this.adminPassWord = adminPassWord;
    }
}
