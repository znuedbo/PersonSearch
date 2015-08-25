<%-- 
    Document   : request_examinations_get
    Created on : 22.07.2015, 10:07:47
    Author     : matmod
--%>
<%@page import="ua.edboservice.DPersonRequestsStatuses2"%>
<%@page import="ua.edboservice.ArrayOfDPersonRequestsStatuses2"%>
<%@page import="java.util.List"%>
<%@page import="ua.edboservice.EDBOPersonSoap"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="edbosync.EdboPersonConnector" %>
<%@page import="edbosync.DataBaseConnector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Сервис загрузки актуальных статусов из ЕДЕБО</title>
    </head>
    <body style="overflow: auto;">
        <h1>Сервис загрузки актуальных статусов из ЕДЕБО</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            String idQualification = request.getParameter("idQualification");
            String idSpeciality = request.getParameter("idSpeciality");
            String createDate = request.getParameter("createDate");
            DataBaseConnector dbc = new DataBaseConnector();
            String sql = "";
            if (idSpeciality == null) {
                sql = "SELECT * \n"
                        + "FROM personspeciality \n"
                        + "WHERE\n"
                        + "(edboID is not null and QualificationID = " + idQualification 
                        + ((createDate == null) ? "" : " and CreateDate >= '" + createDate + "'")
                        + ");";
            } else {
                sql = "SELECT * \n"
                        + "FROM personspeciality \n"
                        + "WHERE\n"
                        + "(edboID is not null and SepcialityID = " + idSpeciality 
                        + ((createDate == null) ? "" : " and CreateDate >= '" + createDate + "'")
                        + ");";
            }

            ResultSet requestWithStatuses = dbc.executeQuery(sql);
            if (!requestWithStatuses.next()) {
                out.print("Відсутні записи у базі даних");
                out.print(sql);
                out.flush();;
            } else {
                do {
                    EdboPersonConnector edbo = new EdboPersonConnector();
                    EDBOPersonSoap soap = edbo.getSoap();
                    int idPersonSpeciality = requestWithStatuses.getInt("idPersonSpeciality");
                    int idPersonRequest = requestWithStatuses.getInt("edboID");
                    ArrayOfDPersonRequestsStatuses2 arrayOfDPersonRequestsStatuses2 = soap.personRequestsStatusesGet2(edbo.getSessionGuid(), edbo.getLanguageId(), idPersonRequest);
                    if (arrayOfDPersonRequestsStatuses2 == null) {
                        edbo = new EdboPersonConnector();
                        if (edbo != null) { // reconnected
                            arrayOfDPersonRequestsStatuses2 = soap.personRequestsStatusesGet2(edbo.getSessionGuid(), edbo.getLanguageId(), idPersonRequest);
                        }
                        if (arrayOfDPersonRequestsStatuses2 == null) {
                            out.print(edbo.processErrors());
                            break;
                        }
                    }
                    List<DPersonRequestsStatuses2> dPersonRequestsStatuses2s = arrayOfDPersonRequestsStatuses2.getDPersonRequestsStatuses2();
                    DPersonRequestsStatuses2 dprs = dPersonRequestsStatuses2s.get(0); // только последний статус
                    requestWithStatuses.updateInt("StatusID", dprs.getIdPersonRequestStatusType());
                    requestWithStatuses.updateString("NumberProtocol", dprs.getNumberProtocol());
                    requestWithStatuses.updateString("DateProtocol", dprs.getDateProtocol().toString());
                    requestWithStatuses.updateInt("StatusIsBudjet", dprs.getIsBudejt());
                    requestWithStatuses.updateInt("StatusIsContract", dprs.getIsContract());
                    requestWithStatuses.updateRow();
                    out.println("<br /> Заявка №" + idPersonSpeciality + ": " + dprs.getIdPersonRequestStatusType() + " " + dprs.getNumberProtocol() + " " + dprs.getDateProtocol().toString() + " " + dprs.getDateLastChange() + " Дата создания: " + requestWithStatuses.getString("CreateDate"));
                    out.flush();
                } while (requestWithStatuses.next());
            }
        %>
    </body>
</html>
