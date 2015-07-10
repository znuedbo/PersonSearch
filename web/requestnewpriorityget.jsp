<%-- 
    Document   : requestnewpriorityget
    Created on : 09.07.2015, 13:55:41
    Author     : matmod
--%>

<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboRequest edboRequest = new EdboRequest();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(edboRequest.newPriorityGet(personCodeU));
    out.flush();
%>