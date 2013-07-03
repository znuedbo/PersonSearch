<%-- 
    Document   : updatestatusedbo
    Created on : 02.07.2013, 19:06:16
    Author     : mathdep
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
out.print(Sync.changeRequestStatus(1, 4));
out.flush();
%>
