<%@page import="test.cafe.dto.CafeCommentDto"%>
<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 폼전송 파라미터 
    	int ref_group = Integer.parseInt(request.getParameter("ref_group"));
    	String target_id = request.getParameter("target_id");
    	String content = request.getParameter("content");
    	/* 
    		원글의 댓글은 comment_group 번호가 전송이 안되고
    		댓글의 댓글은 comment_group 번호가 전송이 된다.
    		따라서 null 여부를 조사하면 원글의 댓그인지 댓글의 댓글인지 판단할 수 없다.
    	*/
    	String comment_group = request.getParameter("comment_group");
    	
    	// 댓글 작성자는 session 영역에서 얻기
    	String writer = (String)session.getAttribute("id");
    	// 댓글의 시퀀스 번호 미리 얻어내기
    	int seq = CafeCommentDao.getInstance().getSequence();
    	// 저장할 댓글의 정보를 dto 에 담기
    	CafeCommentDto dto = new CafeCommentDto();
    	dto.setNum(seq);
    	dto.setWriter(writer);
    	dto.setTarget_id(target_id);
    	dto.setContent(content);
    	dto.setRef_group(ref_group);
    	// 게시글의 댓글인 경우
    	if(comment_group == null){
    		// 댓글의 글번호를 comment_group 번호로 사용한다.
    		dto.setComment_group(seq);
    	}else{
    		// 전송된 comment_group 번호를 숫자로 바꿔 dto에 넣기.
    	}
    	
    	// 댓글 정보를 db에 저장
    	CafeCommentDao.getInstance().insert(dto);
    	   //응답하기 (원글 자세히 보기로 다시 리다일렉트 시킨다)
    	   String cPath=request.getContextPath();
    	   response.sendRedirect(cPath+"/cafe/detail.jsp?num="+ref_group);

    	%>
