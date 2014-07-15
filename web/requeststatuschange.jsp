<%@page import="edbosync.EdboRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EdboRequest edboRequest = new EdboRequest();
    request.setCharacterEncoding("UTF-8");
    int idStatus = Integer.parseInt(request.getParameter("idStatus"));
    int idPersonRequest  = Integer.parseInt(request.getParameter("idPersonRequest"));
    String numberProtocol = request.getParameter("numberProtocol");
    String dateProtocol = request.getParameter("dateProtocol");
    out.print(edboRequest.changeStatus(idPersonRequest, idStatus, numberProtocol, dateProtocol));
    out.flush();
%>