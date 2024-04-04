package hospital.DTO;

import java.util.Date;

public class Reservation {
	private int r_no;
	private String user_id;
	private String r_category;
	private Date r_date;
	private String r_time;
	
	// 기본 생성자
	public Reservation() {
		
	}

	// 생성자
	public Reservation(int r_no, String user_id, String r_category, Date r_date, String r_time) {
		
		this.r_no = r_no;
		this.user_id = user_id;
		this.r_category = r_category;
		this.r_date = r_date;
		this.r_time = r_time;
	}

	// getter, setter
	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getR_category() {
		return r_category;
	}


	public void setR_category(String r_category) {
		this.r_category = r_category;
	}


	public Date getR_date() {
		return r_date;
	}


	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}


	public String getR_time() {
		return r_time;
	}


	public void setR_time(String r_time) {
		this.r_time = r_time;
	}


	// toString
	@Override
	public String toString() {
		return "Reservation [r_no=" + r_no + ", user_id=" + user_id + ", r_category=" + r_category + ", r_date="
				+ r_date + ", r_time=" + r_time + "]";
	}
	
	
	
}


