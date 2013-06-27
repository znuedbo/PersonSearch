<%-- 
    Document   : search
    Created on : 11.06.2013, 11:40:51
    Author     : С.В. Чопоров (S.V. Choporov)
--%>
<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
String series = request.getParameter("series");
String number = request.getParameter("number");
out.print(Sync.findPersonEdbo(series, number));
out.flush();
%>