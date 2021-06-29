package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao == null) dao = new UsersDao();
		return dao;
	}
	
	
	// insert
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into users(id,pwd,email,regdate) values (?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			
			flag = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		if(flag>0) return true;
		else return false;	
	}
	
	// select
	public boolean isValid(UsersDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isValid = false;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select id,pwd,email from users where id = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			
			isValid = pstmt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return isValid;
	}
	
	
	// id check
	public boolean isExist(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		boolean isExist = false;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select id from users where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isExist = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return isExist;
	}
	
	// select dto
	public UsersDto getData(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = new UsersDto();
		try {
			conn = new DbcpBean().getConn();
			String sql = "select id,pwd,email,profile,regdate from users where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPwd(rs.getString("pwd"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	// delete
	public void delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete from users where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.execute();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	   //비밀번호를 수정하는 메소드
	   public boolean updatePwd(UsersDto dto) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int flag = 0;
	      try {
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "UPDATE users"
	               + " SET pwd=?"
	               + " WHERE id=?";
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩
	         pstmt.setString(1, dto.getPwd());
	         pstmt.setString(2, dto.getId());
	         //insert or update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
	         flag = pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      if (flag > 0) {
	         return true;
	      } else {
	         return false;
	      }
	   }
	
	
	   // 프로필 사진 업데이트
	   public boolean updateImage(UsersDto dto) {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      int flag = 0;
		      try {
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문 작성
		         String sql = "UPDATE users"
		               + " SET profile=?"
		               + " WHERE id=?";
		         pstmt = conn.prepareStatement(sql);
		         //? 에 바인딩할 내용이 있으면 여기서 바인딩
		         pstmt.setString(1, dto.getProfile());
		         pstmt.setString(2, dto.getId());
		  
		         flag = pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         try {
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close();
		         } catch (Exception e) {
		         }
		      }
		      if (flag > 0) {
		         return true;
		      } else {
		         return false;
		      }
	   }
	   
	   
	   public boolean update(UsersDto dto) {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      int flag = 0;
		      try {
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문 작성
		         String sql = "UPDATE users"
		               + " SET email = ?, profile = ?"
		               + " WHERE id = ?";
		         pstmt = conn.prepareStatement(sql);
		         //? 에 바인딩할 내용이 있으면 여기서 바인딩
		         pstmt.setString(1, dto.getEmail());
		         pstmt.setString(2, dto.getProfile());
		         pstmt.setString(3, dto.getId());
	
		         flag = pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         try {
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close();
		         } catch (Exception e) {
		         }
		      }
		      if (flag > 0) {
		         return true;
		      } else {
		         return false;
		      }
	   }
	
	
	
}


