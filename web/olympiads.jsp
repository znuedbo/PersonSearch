<%-- 
    Document   : olympiads
    Created on : 25.06.2013, 10:17:57
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Synchronizer Sync = new Synchronizer();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(Sync.getPersonOlympiadsEdboJson(personCodeU));
    out.flush();
%>
