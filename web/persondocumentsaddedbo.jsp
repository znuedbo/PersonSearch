<%-- 
    Document   : persondocumentsaddedbo
    Created on : 28.06.2013, 14:35:37
    Author     : mathdep
--%>

<%@page import="edbosync.EdboDocuments"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboDocuments edboDocuments = new EdboDocuments();
    request.setCharacterEncoding("UTF-8");
    int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
    out.print(edboDocuments.sync(personIdMySql));
    out.flush();
%>
