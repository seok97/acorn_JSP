package my.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import my.blog.dto.MyDto;
import test.util.DbcpBean;

public class MyDao {
	private static MyDao dao;
	private MyDao() {}
	
	public static MyDao getInstance() {
		if(dao == null) {
			dao = new MyDao();
		}
		return dao;
	}
	// update
	public boolean update(MyDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update myboard set b_title = ?, b_content=? where b_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getB_title());
			pstmt.setString(2, dto.getB_content());
			pstmt.setInt(3, dto.getB_idx());
			
			flag = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}
		return false;
	}
	
	//select
	public MyDto select(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyDto dto = new MyDto();
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "select b_idx,b_sumnail,b_title,b_content,to_char(b_regedate,'dl') b_regedate,b_writer,b_like from myboard where b_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
		          dto.setB_idx(rs.getInt("b_idx"));
		          dto.setB_content(rs.getString("b_content"));
		          dto.setB_title(rs.getString("b_title"));
		          dto.setB_like(rs.getInt("b_like"));
		          dto.setB_regedate(rs.getString("b_regedate"));
		          dto.setB_writer(rs.getString("b_writer"));
		          dto.setB_sumnail(rs.getString("b_sumnail"));
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
		return dto;
	}
	
	// 새글 작성
	public boolean insert(MyDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into myboard (b_idx,b_sumnail,b_title,b_content,b_regedate,b_writer,b_like) values " + 
							"(myboard_seq.nextval, ?, ?, ?, sysdate, ?, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getB_sumnail());
			pstmt.setString(2, dto.getB_title());
			pstmt.setString(3, dto.getB_content());
			pstmt.setString(4, dto.getB_writer());
			System.out.println(sql);
			flag = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}
		return false;
	}
	
	//글 목록을 리턴하는 메소드 
	   public List<MyDto> getList(MyDto dto){
	      //글목록을 담을 ArrayList 객체 생성
	      List<MyDto> list=new ArrayList<MyDto>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT *" + 
	               "      FROM" + 
	               "          (SELECT result1.*, ROWNUM AS rnum" + 
	               "          FROM" + 
	               "              (SELECT b_idx,b_sumnail,b_title,b_content,to_char(b_regedate,'dl') b_regedate,b_writer,b_like" + 
	               "              FROM myboard" + 
	               "              ORDER BY b_idx DESC) result1)" + 
	               "      WHERE rnum BETWEEN ? AND ?";
	         pstmt = conn.prepareStatement(sql);
	         System.out.println(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.
	         pstmt.setInt(1, dto.getStartRownNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //select 문 수행하고 ResultSet 받아오기
	         rs = pstmt.executeQuery();
	         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
	         while (rs.next()) {
	          MyDto tmpdto = new MyDto();
	          tmpdto.setB_idx(rs.getInt("b_idx"));
	          tmpdto.setB_content(rs.getString("b_content"));
	          tmpdto.setB_title(rs.getString("b_title"));
	          tmpdto.setB_like(rs.getInt("b_like"));
	          tmpdto.setB_regedate(rs.getString("b_regedate"));
	          tmpdto.setB_writer(rs.getString("b_writer"));
	          tmpdto.setB_sumnail(rs.getString("b_sumnail"));
	          list.add(tmpdto);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return list;
	   }
	   
	   
	   //전체 글의 갯수를 리턴하는 메소드
	   public int getCount() {
	      //글의 갯수를 담을 지역변수 
	      int count=0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = new DbcpBean().getConn();
	         //select 문 작성
	         String sql = "SELECT NVL(MAX(ROWNUM), 0) AS b_idx "
	               + " FROM myboard";
	         pstmt = conn.prepareStatement(sql);
	         // ? 에 바인딩 할게 있으면 여기서 바인딩한다.

	         //select 문 수행하고 ResultSet 받아오기
	         rs = pstmt.executeQuery();
	         //while문 혹은 if문에서 ResultSet 으로 부터 data 추출
	         if (rs.next()) {
	            count=rs.getInt("b_idx");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	         }
	      }
	      return count;
	   }
}
