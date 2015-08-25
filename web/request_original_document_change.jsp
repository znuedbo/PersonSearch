<%-- 
    Document   : request_original_document_change
    Created on : 11.08.2015, 13:04:32
    Author     : matmod
--%>

<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
EdboRequest edboRequest = new EdboRequest();
request.setCharacterEncoding("UTF-8");
int edboId = Integer.parseInt(request.getParameter("edboId"));
out.print(edboRequest.originalDocumentChange(edboId));
out.flush();
%>
