package hospital.DAO;

import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hospital.DTO.Reservation;

public class ReservationDAO extends JDBConnection{
	
	// 어드민 전용 데이터 목록
	public List <Reservation> list(){
		
		// 예약을 담을 컬렌셕 객체 생성
		List<Reservation> reservationList = new ArrayList<Reservation>();
		
		// SQL
		String sql = " SELECT * "
				   + " FROM reservation ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Reservation reservation = new Reservation();
				
				reservation.setR_no(rs.getInt("r_no"));
				reservation.setUser_id(rs.getString("user_id"));
				reservation.setR_category(rs.getString("r_category"));
				reservation.setR_date(rs.getTimestamp("r_date"));
				reservation.setR_time(rs.getString("r_time"));
				
				reservationList.add(reservation);
			}
			
		} catch (SQLException e) {
			System.err.println("예약 내역 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 예약 반환
		return reservationList;
				
	}
	
	// 사용자 전용 데이터 목록
	public List<Reservation> listByUserId(String userId) {
	    // 예약을 담을 컬렉션 객체 생성
	    List<Reservation> reservationList = new ArrayList<>();

	    // SQL
	    String sql = "SELECT * FROM reservation WHERE user_id = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Reservation reservation = new Reservation();

	            reservation.setR_no(rs.getInt("r_no"));
	            reservation.setUser_id(rs.getString("user_id"));
	            reservation.setR_category(rs.getString("r_category"));
	            reservation.setR_date(rs.getTimestamp("r_date"));
	            reservation.setR_time(rs.getString("r_time"));

	            reservationList.add(reservation);
	        }
	    } catch (SQLException e) {
	        System.err.println("예약 내역 조회 시, 예외 발생");
	        e.printStackTrace();
	    }
	    // 예약 반환
	    return reservationList;
	}
	
	// 데이터 등록
	public int insert(HttpServletRequest request, Reservation reservation) {
	    int result = 0;

	    // 세션에서 user_id 가져오기
	    HttpSession session = request.getSession();
	    String sessionUserId = (String) session.getAttribute("loginId");

	    // 사용자의 세션 user_id와 예약 객체의 user_id가 일치하는 경우에만 예약을 추가합니다.
	    if (sessionUserId != null && sessionUserId.equals(reservation.getUser_id())) {
	        String sql = " INSERT INTO Reservation (r_no, user_id, r_category, r_date, r_time) " 
	                   + " VALUES (SEQ_RES_NO.NEXTVAL, ?, ?, ?, ?) ";

	        try {
	            psmt = con.prepareStatement(sql); 
	            psmt.setString(1, sessionUserId); // 세션에서 가져온 user_id 사용
	            psmt.setString(2, reservation.getR_category()); 
	            psmt.setDate(3, new java.sql.Date(reservation.getR_date().getTime())); 
	            psmt.setString(4, reservation.getR_time());

	            result = psmt.executeUpdate(); 

	        } catch (SQLException e) {
	            System.err.println("예약 진행 시, 예외 발생");
	            e.printStackTrace();
	        }
	    } else {
	        System.err.println("사용자 세션 정보와 예약 객체의 user_id가 일치하지 않습니다.");
	    }

	    return result;
	}

	
	
	// 중복 확인 
	public boolean check(HttpServletRequest request, Reservation reservation) {
	    boolean result = false;

	    // 예약 객체에서 진료 날짜와 시간을 가져옴
	    java.util.Date utilDate = reservation.getR_date(); // java.util.Date
	    java.sql.Date r_date = new java.sql.Date(utilDate.getTime()); // java.sql.Date로 변환
	    String r_time = reservation.getR_time();

	    // SQL
	    String sql = "SELECT * FROM reservation WHERE r_date = ? AND r_time = ?";

	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setDate(1, r_date);
	        pstmt.setString(2, r_time);
	        ResultSet rs = pstmt.executeQuery();

	        // 중복되는 예약이 있으면 결과를 true로 설정
	        if (rs.next()) {
	            result = true;
	        }
	    } catch (SQLException e) {
	        System.err.println("중복 확인 시, 예외 발생");
	        e.printStackTrace();
	    }

	    return result;
	}

		
	
	// 데이터 삭제
	public int delete(int no) {
		int result = 0;		// 결과 : 적용된 데이터 건수
				
		String sql = " DELETE FROM RESERVATION "
				   + " WHERE r_no = ? ";

		try {
			psmt = con.prepareStatement(sql);	
			psmt.setInt( 1, no );				
					
			result = psmt.executeUpdate();		
														
														
		} catch (SQLException e) {
			System.err.println("예약 취소 시, 예외 발생");
					e.printStackTrace();
		}
				
		return result;
	}


	

		
}
