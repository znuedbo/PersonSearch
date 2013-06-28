<%-- 
    Document   : persondocumentsaddedbo
    Created on : 28.06.2013, 14:35:37
    Author     : mathdep
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
out.print(Sync.addPersonDocumentsEdbo(personIdMySql));
out.flush();
%>
