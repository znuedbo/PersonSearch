<%-- 
    Document   : personaddedbo
    Created on : 27.06.2013, 15:58:30
    Author     : mathdep
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
int entrantDocumentIdMySql = Integer.parseInt(request.getParameter("entrantDocumentIdMySql"));
int personalDocumentIdMySql = Integer.parseInt(request.getParameter("personalDocumentIdMySql"));
out.print(Sync.addPersonEdbo(personIdMySql, entrantDocumentIdMySql, personalDocumentIdMySql));
out.flush();
%>