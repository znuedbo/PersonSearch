<%-- 
    Document   : documents
    Created on : 11.06.2013, 22:55:27
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.EdboDocuments"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboDocuments edboDocuments = new EdboDocuments();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(edboDocuments.load(personCodeU));
    out.flush();
%>
