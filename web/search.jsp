<%-- 
    Document   : search
    Created on : 11.06.2013, 11:40:51
    Author     : С.В. Чопоров (S.V. Choporov)
--%>
<%@page import="edbosync.EdboPerson"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboPerson edboPerson = new EdboPerson();
    request.setCharacterEncoding("UTF-8");
    String series = request.getParameter("series");
    String number = request.getParameter("number");
    out.print(edboPerson.find(series, number));
    out.flush();
%>