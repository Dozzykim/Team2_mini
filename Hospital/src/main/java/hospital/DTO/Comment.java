package hospital.DTO;

import java.util.Date;

public class Comment {
	
	private int c_no;
	private int b_no;
	private String user_id;
	private String content;
	private Date reg_date;
	private Date upd_date;
	
	public Comment() {
		
	}
	
	public Comment(int b_no, String userId, String content) {
		this.b_no = b_no;
		this.user_id = userId;
		this.content = content;
		this.reg_date = new Date();
		this.upd_date = new Date();
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpd_date() {
		return upd_date;
	}

	public void setUpd_date(Date upd_date) {
		this.upd_date = upd_date;
	}


	@Override
	public String toString() {
		return "Comment [c_no=" + c_no + ", b_no=" + b_no + ", user_id=" + user_id + ", content=" + content
				+ ", reg_date=" + reg_date + ", upd_date=" + upd_date + "]";
	}
}
