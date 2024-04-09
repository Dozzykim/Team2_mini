package hospital.Service;

import java.util.List;
import java.util.ArrayList;

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
		UserDAO userDAO = new UserDAO();
		Users user = userDAO.myinfo(user_id);
		return user;
	}
	
	
	

	

	




	
	
}
