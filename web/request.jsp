<%-- 
    Document   : request
    Created on : 30.06.2013, 15:05:30
    Author     : mathdep
--%>

<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
EdboRequest edboRequest = new EdboRequest();
request.setCharacterEncoding("UTF-8");
int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
int personSpeciality = Integer.parseInt(request.getParameter("personSpeciality"));
out.print(edboRequest.add(personIdMySql, personSpeciality));
out.flush();
%>
