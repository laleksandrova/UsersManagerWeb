package com.umfu.viewmodels.shared;

public class PagerVM {

    private int page;
    private int pageSize;
    private int pagesCount;

    public PagerVM() { }

    public PagerVM(int page, int pageSize) {

        this.page = page;
        this.pageSize = pageSize;
    }

    public int getPage() { return page; }
    public void setPage(int page) { this.page = page; }

    public int getPageSize() { return pageSize; }
    public void setPageSize(int pageSize) { this.pageSize = pageSize; }

    public int getPagesCount() { return pagesCount; }
    public void setPagesCount(int pagesCount) { this.pagesCount = pagesCount; }
}
