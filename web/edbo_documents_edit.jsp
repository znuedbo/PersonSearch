<%@page import="edbosync.EdboDocuments"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboDocuments documents = new EdboDocuments();
    request.setCharacterEncoding("UTF-8");
    int idPersonMySql = Integer.parseInt(request.getParameter("idPersonMySql"));
    out.print(documents.edit(idPersonMySql));
    out.flush();
%>