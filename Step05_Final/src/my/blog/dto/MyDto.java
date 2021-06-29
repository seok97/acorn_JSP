package my.blog.dto;

public class MyDto {
	private int b_idx;
	private String b_sumnail;
	private String b_title;
	private String b_content;
	private String b_regedate;
	private String b_comment;
	private String b_writer;
	private int b_like;
	private int StartRowNum;
	private int EndRowNum;
	
	public MyDto() {
		
	}

	
	
	public int getStartRownNum() {
		return StartRowNum;
	}



	public void setStartRownNum(int startRowNum) {
		StartRowNum = startRowNum;
	}



	public int getEndRowNum() {
		return EndRowNum;
	}



	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}



	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_sumnail() {
		return b_sumnail;
	}

	public void setB_sumnail(String b_sumnail) {
		this.b_sumnail = b_sumnail;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_regedate() {
		return b_regedate;
	}

	public void setB_regedate(String b_regedate) {
		this.b_regedate = b_regedate;
	}

	public String getB_comment() {
		return b_comment;
	}

	public void setB_comment(String b_comment) {
		this.b_comment = b_comment;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	

}
