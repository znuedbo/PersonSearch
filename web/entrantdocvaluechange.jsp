<%-- 
    Document   : entrantdocvaluechange
    Created on : 01.07.2015
    Author     : С.В. Чопоров (S.V. Choporov)
--%>

<%@page import="edbosync.EdboDocuments"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboDocuments edboDocuments = new EdboDocuments();
    request.setCharacterEncoding("UTF-8");
    int iddoc = Integer.parseInt(request.getParameter("iddoc"));
    out.print(edboDocuments.entrantDocumentValueChange(iddoc));
    out.flush();
%>
