<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboRequest edboRequest = new EdboRequest();
    request.setCharacterEncoding("UTF-8");
    int idStatus = Integer.parseInt(request.getParameter("idStatus"));
    int idQualification  = Integer.parseInt(request.getParameter("idQualification"));
    String createDate = request.getParameter("createDate");
    out.print(edboRequest.getIds(idStatus, idQualification, createDate));
    out.flush();
%>