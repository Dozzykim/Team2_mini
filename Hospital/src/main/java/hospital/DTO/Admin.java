package hospital.DTO;

import java.util.Date;

public class Admin {

	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_age;
	private Date emp_date;
	public Admin() {
		
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_age() {
		return admin_age;
	}
	public void setAdmin_age(String admin_age) {
		this.admin_age = admin_age;
	}
	public Date getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(Date emp_date) {
		this.emp_date = emp_date;
	}
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name=" + admin_name + ", admin_age="
				+ admin_age + ", emp_date=" + emp_date + "]";
	}

	
	
	
}
