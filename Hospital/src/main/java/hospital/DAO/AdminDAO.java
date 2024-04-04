package hospital.DAO;

import java.sql.SQLException;

import hospital.DTO.Admin;

public class AdminDAO extends JDBConnection {

	/**
	 * 로그인
	 * @param user
	 * @return
	 */
	public Admin login(Admin admin) {
		
		
		// SQL 작성
		String sql = " SELECT * "
	            + " FROM admin "
	            + " WHERE admin_id = ? and admin_pw = ? ";

		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, admin.getAdmin_id() );		
			psmt.setString( 2, admin.getAdmin_pw() );	
			
			// 쿼리(SQL) 실행 -> 결과 - RestultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				admin.setAdmin_id( rs.getString("admin_id") );
				admin.setAdmin_pw( rs.getString("admin_pw"));
				admin.setAdmin_name( rs.getString("admin_name") );
				admin.setAdmin_age( rs.getString("admin_age") );
				admin.setEmp_date( rs.getDate("emp_date") );
				
				
				return admin;		// 로그인 성공
				
			}
			return null;
			
		} catch (SQLException e) {
			System.err.println("게시글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}
}
