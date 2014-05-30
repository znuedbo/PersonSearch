<%-- 
    Document   : getphoto
    Created on : 30.05.2014, 17:03:34
    Author     : Сергей Чопоров
--%>
<%@page import="edbosync.EdboPhoto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboPhoto photo = new EdboPhoto();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(photo.load(personCodeU));
    out.flush();
%>