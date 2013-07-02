<%-- 
    Document   : editdocumentedbo
    Created on : 02.07.2013, 15:47:47
    Author     : mathdep
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
int documentIdMySql = Integer.parseInt(request.getParameter("documentIdMySql"));
out.print(Sync.editDocumentEdbo(documentIdMySql));
out.flush();
%>
