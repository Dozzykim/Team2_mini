package hospital.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import hospital.DTO.Board;
import hospital.DTO.Comment;

public class CmntDAO extends JDBConnection {
	
	// 해당 게시글의 댓글 세팅
	public List<Comment> list(int boardNo) {
		List<Comment> cmntList = new ArrayList<Comment>();
		
		String sql = " SELECT * "
				   + " FROM comments "
				   + " WHERE b_no = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setInt( 1, boardNo );
			rs = psmt.executeQuery();
			
			
			
			
		}
		
		
		
		return cmntList;
	}
	
	
	// 댓글 작성
	public int insert (Comment comment) {
		int result = 0;
		
		String sql = " INSERT INTO comments (c_no, user_id, c_content) "
				   + " VALUES (SEQ_CMNT_NO.NEXTVAL, ?, ?) ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, comment.getUser_id());
			psmt.setString(2, comment.getContent());
			
			result = psmt.executeUpdate(); // 성공 -> 1, 실패 -> 0
			
		} catch (SQLException e) {
			System.err.println("댓글 등록 시, 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
}
