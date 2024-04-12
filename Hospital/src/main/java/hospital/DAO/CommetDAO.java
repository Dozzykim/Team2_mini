package hospital.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital.DTO.Comment;

public class CommetDAO extends JDBConnection{
	
	// 댓글 불러오기
	public List<Comment> list (int boardNo) {
		List<Comment> cmmtList = new ArrayList<Comment>();
		
		String sql = " SELECT * "
				   + " FROM comments "
				   + " WHERE b_no = ?"
				   + " ORDER BY c_reg_date ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				Comment cmmt = new Comment();
				
				cmmt.setC_no(rs.getInt("c_no"));
				cmmt.setUser_id(rs.getString("user_id"));
				cmmt.setContent(rs.getString("c_content"));
				cmmt.setReg_date(rs.getDate("c_reg_date"));
				
				cmmtList.add(cmmt);
			}
		} catch (SQLException e) {
			System.err.println("댓글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		
		return cmmtList;
	}
	
	// 댓글 작성
	public int insert(Comment comment) {
		int result = 0;
		
		String sql = " INSERT INTO comments (c_no, b_no, user_id, c_content)"
				   + " VALUES (SEQ_CMNT_NO.NEXTVAL, ?, ?, ?) "; 
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, comment.getB_no());
			psmt.setString(2, comment.getUser_id());
			psmt.setString(3, comment.getContent());
			
			result = psmt.executeUpdate();
			
			System.out.println("글번호: " + comment.getB_no());
			System.out.println("작성자: " + comment.getUser_id());
			System.out.println("댓글내용: " + comment.getContent());
			 
			
		} catch (SQLException e) {
			System.err.println("댓글 등록 시 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 댓글 삭제
	public int delete(int c_no) {
		int result = 0;
		
		String sql = " DELETE FROM comments "
				   + " WHERE c_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);	// 쿼리 실행 객체 생성
			psmt.setInt( 1, c_no );				// 1번 ? 에 게시글 번호를 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("댓글 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}

}
