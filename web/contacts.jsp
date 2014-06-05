<%-- 
    Document   : contacts
    Created on : 11.06.2013, 18:58:19
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.EdboContacts"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboContacts contacts = new EdboContacts();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(contacts.load(personCodeU));
    out.flush();
%>