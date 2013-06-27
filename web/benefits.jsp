<%-- 
    Document   : benefits
    Created on : 25.06.2013, 10:42:23
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Synchronizer Sync = new Synchronizer();
    request.setCharacterEncoding("UTF-8");
    int personId= Integer.parseInt(request.getParameter("personId"));
    out.print(Sync.getPersonBenefitsEdbo(personId));
    out.flush();
%>
