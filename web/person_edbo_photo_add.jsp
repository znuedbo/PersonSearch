<%-- 
    Document   : person_edbo_photo_add
    Created on : 25.08.2015, 15:34:31
    Author     : matmod
--%>

<%@page import="edbosync.EdboPhoto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String personCodeU = request.getParameter("edboId");
    String base64 = request.getParameter("base64");
    EdboPhoto photo = new EdboPhoto();
    out.print(photo.add(personCodeU, base64));
    out.flush();
    %>
