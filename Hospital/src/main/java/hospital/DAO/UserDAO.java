package hospital.DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import hospital.DTO.PersistentLogins;
import hospital.DTO.Reservation;
import hospital.DTO.Users;

public class UserDAO extends JDBConnection {

	/**
	 * 회원 가입 
	 * @param user
	 * @return
	 */
	public int join(Users user) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO users (user_id, user_pw, user_name, user_age, user_pno, user_address) "
				   + " VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, user.getUser_id() );		
			psmt.setString( 2, user.getUser_pw() );	
			psmt.setString( 3, user.getUser_name() );		
			psmt.setString( 4, user.getUser_age() );	
			psmt.setString( 5, user.getUser_pno());
			psmt.setString( 6, user.getUser_address() );		
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {	
			System.err.println("회원가입시 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 아이디 중복확인
	 * @param user_id
	 * @return
	 */
	public boolean idCheck(String user_id) {
	    boolean isExist = false;

	    String sql = "SELECT COUNT(*) cnt FROM USERS WHERE user_id = ?";

	    try {
	        psmt = con.prepareStatement(sql);
	        psmt.setString(1, user_id);

	        rs = psmt.executeQuery();

	        if (rs.next()) {
	        	int count = rs.getInt("cnt");
	            isExist = count > 0 ? true : false; // 아이디가 존재하면 true로 설정
	        } 
	    } catch (Exception e) {
	        System.err.println("아이디 중복체크 시, 예외 발생");
	        e.printStackTrace();
	    }

	    return isExist;
	}



	/**
	 * 로그인
	 * @param user
	 * @return
	 */
	public Users login(Users user) {
		
		
		// SQL 작성
		String sql = " SELECT * "
	            + " FROM users "
	            + " WHERE user_id = ? and user_pw = ? ";

		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, user.getUser_id() );		
			psmt.setString( 2, user.getUser_pw() );	
			
			// 쿼리(SQL) 실행 -> 결과 - RestultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				user.setUser_id( rs.getString("USER_ID") );
				user.setUser_pw( rs.getString("USER_PW"));
				user.setUser_name( rs.getString("USER_NAME") );
				user.setUser_age( rs.getString("USER_AGE") );
				user.setUser_address( rs.getString("USER_ADDRESS") );
				user.setUser_pno( rs.getString("USER_PNO") );
				
				
				return user;		// 로그인 성공
				
			}
			return null;
			
		} catch (SQLException e) {
			System.err.println("게시글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}
	// 토큰 생성
	/**
	 * 토큰 생성
	 * @param p_userId
	 * @return
	 */
	public String insertToken(String p_userId) {
		int result = 0;
		String sql = " INSERT INTO persistent_logins (p_no, p_user_id, p_token)"
				   + " VALUES (SEQ_PER_LOGIN.nextval, ?, ? ) ";
		
		// 토큰 발행
		String p_token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, p_userId);
			psmt.setString(2, p_token);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개 등록되었습니다.");
		return p_token;
	}
	// 토큰 수정
	/**
	 * 토큰 수정
	 * - 기존 토큰 존재 시, 갱신
	 * @param p_userId
	 * @return
	 */
	public String updateToken(String p_userId) {
		int result = 0;
		String sql = " UPDATE persistent_logins"
				   + " SET p_token = ? "
				   + "	,p_upd_date = sysdate "
				   + " WHERE p_user_id = ? ";
		
		// 토큰 발행
		String p_token = UUID.randomUUID().toString();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, p_token);
			psmt.setString(2, p_userId);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보 " + result + "개 수정되었습니다.");
		return p_token;
	}
	
	// 토큰 조회
	// - userId 로 조회
	
	/**
	 * - userId 로 조회
	 * @param p_userId
	 * @return
	 */
	
	public PersistentLogins selectToken(String p_userId) {
		String sql = " SELECT * "
				   + " FROM persistent_logins "
				   + " WHERE p_user_id = ? ";
		
		PersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, p_userId);
			
			rs = psmt.executeQuery();
			if( rs.next() ) {
				persistentLogins = new PersistentLogins();
				persistentLogins.setP_no( rs.getInt("p_no") );
				persistentLogins.setP_user_id( rs.getString("p_user_id") );
				persistentLogins.setP_token( rs.getString("p_token") );
				persistentLogins.setP_reg_date(rs.getDate("p_reg_date") );
				persistentLogins.setP_reg_date(rs.getDate("p_upd_date") );
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	
	// - token 으로 조회
	/**
	 * - p_token 으로 조회
	 * @param p_userId
	 * @return
	 */
	public PersistentLogins selectTokenByToken(String p_token) {
		String sql = " SELECT * "
				   + " FROM persistent_logins "
				   + " WHERE p_token = ? ";
		
		PersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, p_token);
			
			rs = psmt.executeQuery();
			if( rs.next() ) {
				persistentLogins = new PersistentLogins();
				persistentLogins.setP_no( rs.getInt("p_no") );
				persistentLogins.setP_user_id( rs.getString("p_user_id") );
				persistentLogins.setP_token( rs.getString("p_token") );
				persistentLogins.setP_reg_date(rs.getDate("p_reg_date") );
				persistentLogins.setP_reg_date(rs.getDate("p_upd_date") );
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	// 토큰 삭제
	// - 로그아웃 시, 자동 로그인 해제
	
	/**
	 * 토큰 삭제
	 * @param p_userId
	 * @return
	 */
	public int deleteToken(String p_userId) {
		int result = 0;
		String sql = " DELETE FROM persistent_logins WHERE p_user_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, p_userId);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
		}
		System.out.println("자동 로그인 정보 " + result + " 개의 데이터가 삭제되었습니다." );
		return result;
	}

	
	
	// 마이페이지 내 정보 조회
	public Users myinfo(String user_id){
		
		
		
		String sql = " SELECT * FROM users WHERE user_id =  ? ";
		Users user =  new Users();
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				user.setUser_name(rs.getString("user_name"));
				user.setUser_id(rs.getString("user_id"));
				user.setUser_age(rs.getString("user_age"));
				user.setUser_pno(rs.getString("user_pno"));
				user.setUser_address(rs.getString("user_address"));
				
				System.out.println(user.getUser_name());
			}
			
		} catch (SQLException e) {
			System.err.println("내 정보 조회 시 , 예외 발생");
			e.printStackTrace();
		}
				
		return user;
		
	
	}
	
	// 어드민 전용 데이터 목록
	public List<Users> list() {
	    // 예약을 담을 컬렉션 객체 생성
	    List<Users> userList = new ArrayList<Users>();

	    // SQL
	    String sql = "SELECT * " +
	                 "FROM Users " ;

	    try {
	        stmt = con.createStatement();
	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            Users users = new Users();

	            users.setUser_name(rs.getString("user_name"));
	            users.setUser_id(rs.getString("user_id"));
	            users.setUser_pw(rs.getString("user_pw"));
	            users.setUser_age(rs.getString("user_age"));
	            users.setUser_pno(rs.getString("user_pno"));
	            users.setUser_address(rs.getString("user_address"));
	            

	            userList.add(users);
	        }

	    } catch (SQLException e) {
	        System.err.println("예약 내역 조회 시, 예외 발생");
	        e.printStackTrace();
	    } 

	    // 예약 반환
	    return userList;
	}
	
	//


	
	/**
	 * 아이디 찾기
	 * @param user
	 * @return
	 */
	
	public List<String> findId(Users user) {
	    List<String> userIds = new ArrayList<>(); // 아이디를 저장할 리스트

	    // SQL 작성
	    String sql = " SELECT user_id FROM users WHERE user_name = ? AND user_pno = ? ";
	    try {
	        // 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
	        psmt = con.prepareStatement(sql);

	        // psmt.setXXX( 순서번호, 매핑할 값 );
	        psmt.setString(1, user.getUser_name()); // 사용자의 이름 설정
	        psmt.setString(2, user.getUser_pno()); // 사용자의 전화번호 설정

	        // 쿼리(SQL) 실행 -> 결과 - ResultSet (rs)
	        rs = psmt.executeQuery();

	        // 조회 결과를 리스트에 추가
	        while (rs.next()) { // 다음 데이터가 있을 때까지 반복
	            String userId = rs.getString("user_id"); // 아이디 설정
	            userIds.add(userId); // 리스트에 추가
	        }
	    } catch (SQLException e) {
	        System.err.println("아이디 찾기 예외 발생");
	        e.printStackTrace();
	    }

	    return userIds; // 아이디 목록 반환
	}

	/**
	 * 비밀번호 찾기
	 * @param user
	 * @return
	 */
	
	public String findPw(Users user) {
	    String userPw = null; // 비밀번호를 저장할 변수 초기화

	    // SQL 작성
	    String sql = "SELECT user_pw FROM users WHERE user_id = ? AND user_name = ? AND user_pno = ?";
	    try {
	        // 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
	        PreparedStatement psmt = con.prepareStatement(sql);

	        // psmt.setXXX( 순서번호, 매핑할 값 );
	        psmt.setString(1, user.getUser_id()); // 사용자의 아이디 설정
	        psmt.setString(2, user.getUser_name()); // 사용자의 이름 설정
	        psmt.setString(3, user.getUser_pno()); // 사용자의 전화번호 설정

	        // 쿼리(SQL) 실행 -> 결과 - ResultSet (rs)
	         rs = psmt.executeQuery();

	        // 조회 결과가 있으면
	        if (rs.next()) {
	            // 해당하는 비밀번호를 변수에 저장
	            userPw = rs.getString("user_pw");
	        }
	    } catch (SQLException e) {
	        System.err.println("비밀번호 찾기 예외 발생");
	        e.printStackTrace();
	    }

	    return userPw; // 비밀번호 반환
	}





}
		



