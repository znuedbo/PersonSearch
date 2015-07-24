<%-- 
    Document   : request_examinations_get
    Created on : 22.07.2015, 10:07:47
    Author     : matmod
--%>
<%@page import="ua.edboservice.DPersonRequestExaminations"%>
<%@page import="java.util.List"%>
<%@page import="ua.edboservice.ArrayOfDPersonRequestExaminations"%>
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
        <title>JSP Page</title>
    </head>
    <body style="overflow: auto;">
        <h1>Hello World!</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            String idQualification = request.getParameter("idQualification");
            DataBaseConnector dbc = new DataBaseConnector();
            String sql = "SELECT * \n"
                    + "FROM personspeciality \n"
                    + "WHERE\n"
                    + "((`personspeciality`.`Exam1ID` is not null OR `personspeciality`.`Exam2ID` is not null OR `personspeciality`.`Exam3ID` is not null) and edboID is not null and QualificationID = " + idQualification + ");";
            ResultSet requestExaminations = dbc.executeQuery(sql);
            while (requestExaminations.next()) {
                EdboPersonConnector edbo = new EdboPersonConnector();
                EDBOPersonSoap soap = edbo.getSoap();
                int idSubject1 = requestExaminations.getInt("Exam1ID");
                int idSubject2 = requestExaminations.getInt("Exam2ID");
                int idSubject3 = requestExaminations.getInt("Exam3ID");
                int idExamination1 = requestExaminations.getInt("IdPersonRequestExamination1");
                int idExamination2 = requestExaminations.getInt("IdPersonRequestExamination2");
                int idExamination3 = requestExaminations.getInt("IdPersonRequestExamination3");
                int idPersonRequest = requestExaminations.getInt("edboID");
                ArrayOfDPersonRequestExaminations examinationsArray = soap.personRequestExaminationsGet(edbo.getSessionGuid(), edbo.getActualDate(), edbo.getLanguageId(), idPersonRequest);
                if (examinationsArray == null) {
                    edbo = new EdboPersonConnector();
                    if (edbo != null) { // reconnected
                        examinationsArray = soap.personRequestExaminationsGet(edbo.getSessionGuid(), edbo.getActualDate(), edbo.getLanguageId(), idPersonRequest);
                    }
                    if (examinationsArray == null) {
                        out.print(edbo.processErrors());
                        out.flush();
                        break;
                    }
                }
                List<DPersonRequestExaminations> examinationsList = examinationsArray.getDPersonRequestExaminations();
                for (DPersonRequestExaminations examination : examinationsList) {
                    int idSubject = examination.getIdSubject();
                    float examValue = examination.getPersonRequestExaminationValue().floatValue();
                    if (examValue > 0) {
                        if ((idSubject == idSubject1 && idExamination1 == 0) || (idSubject1 == 3 && (30 <= idSubject && idSubject <= 33 || idSubject == 4))) {
                            requestExaminations.updateInt("Exam1ID", idSubject);
                            requestExaminations.updateFloat("Exam1Ball", examValue);
                            requestExaminations.updateInt("IdPersonRequestExamination1", examination.getIdPersonRequestExamination());
                            idExamination1 = examination.getIdPersonRequestExamination();
                            requestExaminations.updateRow();
        %>
        <p>
            <%
                out.print("Код персони: " + requestExaminations.getInt("PersonID") + "; № заявки " + requestExaminations.getInt("idPersonSpeciality") + "; № зявки в ЄДБО: " + idPersonRequest + "; екзамен " + examination.getIdPersonRequestExamination() + " бал екзамену 1: " + examValue);
            %>
        </p>
        <%
        } else if ((idSubject == idSubject2 && idExamination2 == 0) || (idSubject2 == 3 && (30 <= idSubject && idSubject <= 33 || idSubject == 4))) {
            requestExaminations.updateInt("Exam2ID", idSubject);
            requestExaminations.updateFloat("Exam2Ball", examValue);
            requestExaminations.updateInt("IdPersonRequestExamination2", examination.getIdPersonRequestExamination());
            idExamination2 = examination.getIdPersonRequestExamination();
            requestExaminations.updateRow();
        %>
        <p>
            <%
                out.print("Код персони: " + requestExaminations.getInt("PersonID") + "; № заявки " + requestExaminations.getInt("idPersonSpeciality") + "; № зявки в ЄДБО: " + idPersonRequest + "; екзамен " + examination.getIdPersonRequestExamination() + " бал екзамену 2: " + examValue);
            %>
        </p>
        <%
        } else if ((idSubject == idSubject3 && idExamination3 == 0) || (idSubject3 == 3 && (30 <= idSubject && idSubject <= 33 || idSubject == 4))) {
            requestExaminations.updateInt("Exam3ID", idSubject);
            requestExaminations.updateFloat("Exam3Ball", examValue);
            requestExaminations.updateInt("IdPersonRequestExamination3", examination.getIdPersonRequestExamination());
            idExamination3 = examination.getIdPersonRequestExamination();
            requestExaminations.updateRow();
        %>
        <p>
            <%
                out.print("Код персони: " + requestExaminations.getInt("PersonID") + "; № заявки " + requestExaminations.getInt("idPersonSpeciality") + "; № зявки в ЄДБО: " + idPersonRequest + "; екзамен " + examination.getIdPersonRequestExamination() + " бал екзамену 3: " + examValue);
            %>
        </p>
        <%
                out.flush();
            } // if
        } // if examvalue
        else {
        %>
        <p>
            <%
                out.print("Код персони: " + requestExaminations.getInt("PersonID") + "; № заявки " + requestExaminations.getInt("idPersonSpeciality") + "; № зявки в ЄДБО: " + idPersonRequest + "; данні про екзамени в ЭДЕБО відсутні");
            %>
        </p>
        <%
                    }
                } // for
            }
        %>
    </body>
</html>
