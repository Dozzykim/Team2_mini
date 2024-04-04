package hospital.DTO;

import java.util.Date;

public class Comment {
	
	private int no;
	private String user_id;
	private String content;
	private Date reg_date;
	private Date upd_date;
	
	public Comment () {
		
	}
	
	public Comment (String userId, String content) {
		this.user_id = userId;
		this.content = content;
		this.reg_date = new Date();
		this.upd_date = new Date();
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
		return "Comment [no=" + no + ", user_id=" + user_id + ", content=" + content + ", reg_date=" + reg_date
				+ ", upd_date=" + upd_date + "]";
	}
	
	

}
