<%-- 
    Document   : personeducationsget
    Created on : 09.07.2015, 14:37:17
    Author     : matmod
--%>

<%@page import="edbosync.EdboEducationHistory"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboEducationHistory history = new EdboEducationHistory();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(history.educationsGet(personCodeU));
    out.flush();
%>
