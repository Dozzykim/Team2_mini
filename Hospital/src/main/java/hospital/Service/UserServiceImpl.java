package hospital.Service;


import java.util.List;

import hospital.DAO.UserDAO;
import hospital.DTO.PersistentLogins;
import hospital.DTO.Users;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAO();
	
	@Override
	public int join(Users user) {
		int result = userDAO.join(user);
		
		if( result > 0 ) {
			System.out.println("회원 가입 처리 성공!");
		} else {
			System.out.println("회원 가입 실패!");
		}
		// 기본 회원 권한을 추가...
		
		return result;
	}

	@Override
	public Users login(Users user) {
		Users loginUser = userDAO.login(user);
		
		if( loginUser != null ) {
			System.out.println("로그인 성공!");
			return loginUser;
		}
		// 로그인 실패
		System.out.println("로그인 실패!");
		return null;
	}

	@Override
	public String refreshToken(String p_userId) {
		
		PersistentLogins persistentLogins = userDAO.selectToken(p_userId);
		
		String token = null;
		if ( persistentLogins == null ) {
			// 토큰이 없는 경우, 토큰 등록
			token = userDAO.insertToken(p_userId);
		}
		else {
			// 토큰이 없는 경우, 토큰 수정
			token = userDAO.updateToken(p_userId);
		}
		
		return token;
	}

	@Override
	public int deleteToken(String p_userId) {
		int result = userDAO.deleteToken(p_userId);
		if ( result > 0 ) {
			System.out.println("자동 로그인 토큰 삭제 성공!");
		}
		else {
			System.out.println("자동 로그인 토큰 삭제 실패!");
		}
		return result;
	}

	@Override
	public PersistentLogins selectTokenByToken(String p_token) {
		
		PersistentLogins persistentLogins = userDAO.selectTokenByToken(p_token);
		
		if( persistentLogins == null ) {
			System.out.println("인증된 토큰 정보가 존재하지 않습니다.");
			return null;
		}
		else {
			System.out.println("인증된 토큰 확인됨...");
			return persistentLogins;
		}
	}

	@Override
	public boolean idCheck(String user_id) {
		boolean result = userDAO.idCheck(user_id);
		return result;
	}

	@Override
	public Users myinfo(String user_id) {
		Users user = userDAO.myinfo(user_id);
		return user;
	}

	@Override
	public List<String> findId(Users user) {
	    List<String> userId = userDAO.findId(user); // 사용자 아이디를 가져옴
	    if (userId != null && !userId.isEmpty()) { // 아이디가 비어 있지 않은 경우
	        System.out.println("아이디 찾기 성공: " + userId);
	        return userId; // 사용자 아이디 반환
	    } else {
	        System.out.println("아이디를 찾을 수 없습니다.");
	        return null; // 아이디를 찾을 수 없는 경우 null 반환
	    }
	}


	@Override
	public String findPw(Users user) {
	    String userPw = userDAO.findPw(user); // 사용자 비밀번호를 가져옴
	    if (userPw != null && !userPw.isEmpty()) { // 비밀번호가 비어 있지 않은 경우
	        System.out.println("비밀번호 찾기 성공: " + userPw);
	        return userPw; // 사용자 비밀번호 반환
	    } else {
	        System.out.println("비밀번호를 찾을 수 없습니다.");
	        return null; // 비밀번호를 찾을 수 없는 경우 null 반환
	    }
	}


	
}
