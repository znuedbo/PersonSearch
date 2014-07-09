<%-- 
    Document   : requestload
    Created on : 08.07.2014, 11:54:24
    Author     : matmod
--%>

<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboRequest edboRequest = new EdboRequest();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    int idPersonRequest = Integer.parseInt(request.getParameter("idRequest"));
    out.print(edboRequest.load(personCodeU, idPersonRequest));
    out.flush();
%>

