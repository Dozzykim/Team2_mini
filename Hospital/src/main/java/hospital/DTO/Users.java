package hospital.DTO;

public class Users {
    
    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_age;
    private String user_pno;
    private String user_address;

    public Users() {
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_pw() {
        return user_pw;
    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_age() {
        return user_age;
    }

    public void setUser_age(String user_age) {
        this.user_age = user_age;
    }

    public String getUser_pno() {
        return user_pno;
    }

    public void setUser_pno(String user_pno) {
        this.user_pno = user_pno;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    @Override
    public String toString() {
        return "Users [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
                + ", user_age=" + user_age + ", user_pno=" + user_pno + ", user_address=" + user_address + "]";
    }
}
