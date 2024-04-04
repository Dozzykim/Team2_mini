package hospital.DTO;

import java.util.Date;

public class PersistentLogins {
	
	private int p_no;
	private String p_user_id;
	private String p_token;
	private Date p_reg_date;
	private Date p_upd_date;
	
	public PersistentLogins() {

	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_user_id() {
		return p_user_id;
	}
	public void setP_user_id(String p_user_id) {
		this.p_user_id = p_user_id;
	}
	public String getP_token() {
		return p_token;
	}
	public void setP_token(String p_token) {
		this.p_token = p_token;
	}
	public Date getP_reg_date() {
		return p_reg_date;
	}
	public void setP_reg_date(Date p_reg_date) {
		this.p_reg_date = p_reg_date;
	}
	public Date getP_upd_date() {
		return p_upd_date;
	}
	public void setP_upd_date(Date p_upd_date) {
		this.p_upd_date = p_upd_date;
	}
	@Override
	public String toString() {
		return "PersistentLogins [p_no=" + p_no + ", p_user_id=" + p_user_id + ", p_token=" + p_token + ", p_reg_date="
				+ p_reg_date + ", p_upd_date=" + p_upd_date + "]";
	}
	
	
	
	

	
	
	
}
