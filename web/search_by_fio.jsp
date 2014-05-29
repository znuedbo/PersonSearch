<%-- 
    Document   : search_by_fio
    Created on : 25.06.2013, 9:08:27
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%--<%@page import="edbosync.Synchronizer"%>--%>
<%@page import="edbosync.EdboPerson"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//Synchronizer Sync = new Synchronizer();
    EdboPerson edboPerson = new EdboPerson();
    request.setCharacterEncoding("UTF-8");
    String fio = request.getParameter("fio");
//out.print(Sync.findPersonEdbo(fio));
    out.print(edboPerson.find(fio));
    out.flush();
%>