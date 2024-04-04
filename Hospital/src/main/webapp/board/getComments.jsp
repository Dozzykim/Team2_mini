<%@page import="hospital.Service.CmntServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%@ page import="hospital.Service.CmntService" %>
<%@ page import="hospital.DTO.Comment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // CommentService와 같은 서비스 및 DTO 클래스를 임포트하고, 데이터베이스에서 댓글을 가져오는 로직을 작성합니다.
    CmntService cmntService = new CmntServiceImpl(); // 예시로 CommentService를 생성합니다.
    List<Comment> comments = cmntService.list(); // 모든 댓글을 가져옵니다.

    // 가져온 댓글을 HTML 형식으로 반환합니다.
    for (Comment comment : comments) {
%>
        <li><c:out value="<%= comment.getContent() %>"/></li> <!-- 댓글 내용을 출력합니다. -->
<%
    }
%>
