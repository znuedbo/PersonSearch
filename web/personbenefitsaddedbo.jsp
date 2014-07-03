<%-- 
    Document   : personbenefitsaddedbo
    Created on : 29.06.2013, 13:49:16
    Author     : mathdep
--%>

<%@page import="edbosync.EdboBenefits"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboBenefits edboBenefits = new EdboBenefits();
    request.setCharacterEncoding("UTF-8");
    int personIdMySql = Integer.parseInt(request.getParameter("personIdMySql"));
    out.print(edboBenefits.sync(personIdMySql));
    out.flush();
%>
