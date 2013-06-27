<%-- 
    Document   : search_by_fio
    Created on : 25.06.2013, 9:08:27
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
String fio = request.getParameter("fio");
out.print(Sync.findPersonEdbo(fio));
out.flush();
%>