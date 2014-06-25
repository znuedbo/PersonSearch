<%@page import="edbosync.EdboOlympiads"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboOlympiads olymp = new EdboOlympiads();
    request.setCharacterEncoding("UTF-8");
    String personCodeU = request.getParameter("personCodeU");
    out.print(olymp.load(personCodeU));
    out.flush();
%>
