package recipe.dto;

public class PageDto {
	private int currentPage; 	//현재페이지
	private int pageSize;		//한 화면에 띄울 게시글 limit 범위
	private int totalCount;		//전체 게시글
	
	//계산에 필요한 값
	private int startNo;		//limit 시작 인덱스
	private int totalPage;		//전체 페이지 개수       처음 <1 2 3> 끝
	private int startPage;		//페이지 안에 띄울 게시글 시작 idx
	private int endPage;		//페이지 안에 띄울 게실글 끝 idx
	
	//검색에 필요한 값
	private String cat1;
	private String cat2;
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public String getCat1() {
		return cat1;
	}

	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	//생성자
	public PageDto(int currentPage, int totalCount, int pageSize, String cat1, String cat2) {
	    super();
	    this.currentPage = currentPage;
	    this.pageSize = pageSize;
	    this.totalCount = totalCount;
	    totalPage = (totalCount + pageSize - 1) / pageSize;
	    
	    this.currentPage = (currentPage > totalPage || currentPage < 1) ? 1 : currentPage;
	    startNo = (this.currentPage - 1) * pageSize;
	    
	    startPage = ((this.currentPage - 1) / 10) * 10 + 1;
	    endPage = startPage + 9;
	    if (endPage > totalPage) {
	        endPage = totalPage;
	    }
	    
	    this.cat1 = cat1;
	    this.cat2 = cat2;
	}

	
	
	
}
