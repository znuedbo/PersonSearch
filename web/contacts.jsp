<%-- 
    Document   : contacts
    Created on : 11.06.2013, 18:58:19
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%--<%@page import="edbosync.Synchronizer"%> --%>
<%@page import="edbosync.EdboContacts"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//Synchronizer Sync = new Synchronizer();
    EdboContacts contacts = new EdboContacts();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
//out.print(Sync.getPersonContactsEdboJson(personCodeU));
    out.print(contacts.load(personCodeU));
    out.flush();
%>