package my.liketable.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.util.DbcpBean;

public class MyLikeDao {
	private static MyLikeDao dao;
	private MyLikeDao() {}
	
	public static MyLikeDao getInstance() {
		if(dao == null) {
			dao = new MyLikeDao();
		}
		return dao;
	}
	
	// 하트를 이미 눌렀는지 검사
	public boolean likecheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
		         
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
}
