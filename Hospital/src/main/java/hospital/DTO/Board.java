package hospital.DTO;

import java.util.Date;

/** (DTO)
 *  게시글 정보
 *  - 게시글 번호
 *  - 유저id(작성자)
 *  - 제목
 *  - 내용
 *  - 등록일자
 *  - 수정일자
 */

public class Board {

	
	/** (DTO)
	 *  게시글 정보
	 *  - 게시글 번호
	 *  - 유저 아이디(작성자)
	 *  - 카테고리
	 *  - 제목
	 *  - 내용
	 *  - 등록일자
	 *  - 수정일자
	 */
	
	private int no;
	private String user_id;
	private String category;
	private String title;
	private String content;
	private Date reg_date;
	private Date upd_date;
	
	
	// 생성자
	public Board() {
		this("카테고리 없음","제목없음", "글쓴이없음", "내용없음");
	}
	
	public Board(String category, String title, String user_id, String content) {
		this.category = category;
		this.title = title;
		this.user_id = user_id;
		this.content = content;
		this.reg_date = new Date();
		this.upd_date = new Date();
	}
	
	
	// getter,setter...
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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

	// toString...
	@Override
	public String toString() {
		return "Board [no=" + no + ", user_id=" + user_id + ", category=" + category + ", title=" + title + ", content="
				+ content + ", reg_date=" + reg_date + ", upd_date=" + upd_date + "]";
	}
	
	
	
	
	public Board() {
	
	}


	public Board(String title, String user_id, String content) {
		this.title = title;
		this.user_id = user_id;
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


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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
		return "Board [no=" + no + ", user_id=" + user_id + ", category=" + category + ", title=" + title + ", content="
				+ content + ", reg_date=" + reg_date + ", upd_date=" + upd_date + "]";
	}
	
	
	
}
