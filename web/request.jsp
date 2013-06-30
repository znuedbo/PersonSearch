<%-- 
    Document   : request
    Created on : 30.06.2013, 15:05:30
    Author     : mathdep
--%>

<%@page import="edbosync.Synchronizer"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Synchronizer Sync = new Synchronizer();
request.setCharacterEncoding("UTF-8");
int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
int personSpeciality = Integer.parseInt(request.getParameter("personSpeciality"));
out.print(Sync.addPersonRequestEdbo(personIdMySql, personSpeciality));
out.flush();
%>
