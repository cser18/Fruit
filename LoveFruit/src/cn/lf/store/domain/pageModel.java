package cn.lf.store.domain;

import java.util.List;

/**
 * pageModel
 * 里面有所有的页数
 * 计算初页与总页数
 */
public class pageModel {
    private int currentPageNum;  //当前页
    private int pageSize = 6;        //每页显示的条数
    private int totalRecords;    //总共条数 要从数据库找出来
    private int totalPageNum;    //总页数
    private int startIndex;      //开始页数 计算出来的
    private int prePageNum;     //上一页
    private int nextPageNum;    //下一页
    private List list;          //商品的所有信息
    private String url;        //路径
    private int startPage;     //开始页码
    private int endPage;       //结束页码


    /**
     * 计算要返回的pageModel
     * @param currentPageNum
     * @param totalRecords
     * @param pageSize
     */
    public pageModel(int currentPageNum, int totalRecords,int pageSize) {
        this.currentPageNum = currentPageNum;
        this.pageSize = pageSize;
        this.totalRecords = totalRecords;
        //计算当前页的索引
        startIndex = (currentPageNum - 1) * pageSize;
        //计算总页数
        totalPageNum = (totalRecords / pageSize) == 0 ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);

        startPage = currentPageNum - 2;
        endPage = currentPageNum + 2;

        //判断是否够足5页
        if(totalRecords > 5){
            //如果大过5
            if(startPage < 0){
                startPage = 1;
                endPage = startPage + 4;
            }
        }
        //判断上一页
        prePageNum = startIndex - 1;
        if(prePageNum < 0){
            prePageNum = 1;
        }
        //判断下一页
        nextPageNum = startIndex + 1;
        if(nextPageNum >= totalRecords){
            nextPageNum = totalPageNum;
        }
    }

    public pageModel() {
    }

    public int getCurrentPageNum() {
        return currentPageNum;
    }

    public void setCurrentPageNum(int currentPageNum) {
        this.currentPageNum = currentPageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getTotalPageNum() {
        return totalPageNum;
    }

    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getPrePageNum() {
        return prePageNum;
    }

    public void setPrePageNum(int prePageNum) {
        this.prePageNum = prePageNum;
    }

    public int getNextPageNum() {
        return nextPageNum;
    }

    public void setNextPageNum(int nextPageNum) {
        this.nextPageNum = nextPageNum;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
}
