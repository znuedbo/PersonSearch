<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Person search sample</h1>
        <form action="search.jsp" method="post">
            <p>Сервис <b>search.jsp</b> производит поиск персон по серии и номеру документа в базе ЕДБО. 
                При этом допускается указание пустыми серии (series) или номера (number) (должные передаваться пустые строки).      
                Способ передачи дачи параметров (get или post) безразличен. Результатом является массив персон,
                если таковых найдено более одной, или <b>0</b> в случае ошибки (например, ЕДБО возвращает нулевые массивы).
                В массиве в формате <i>json</i> будет представлен базовый набор информации.</p>
            <p>Test numbers: 43042636 ; 36273064 ; 40542040 ; 43176851</p>
            <p>Серия: <input type="text" name="series" value="АР"></p>
            <p>Номер: <input type="text" name="number" value=""></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="search_by_fio.jsp" method="post">
            <p>Сервис <b>search_by_fio.jsp</b> производит поиск персон по маске ФИО в базе ЕДБО. 
                При этом латинские символы <b>c</b>, <b>C</b>, <b>i</b>, <b>I</b> и 
                кириллические символы <b>с</b>, <b>С</b>, <b>і</b>, <b>І</b> меняются на
                <b>?</b> (знак вопроса - произвольный символ); <i>пробелы</i> на <b>*</b> - произвольный набор символов.
                Параметр <b>fio</b> - маска ФИО.
                Способ передачи дачи параметра (get или post) безразличен. Результатом является массив персон,
                если таковых найдено более одной, или <b>0</b> в случае ошибки (например, ЕДБО возвращает нулевые массивы).
                В массиве в формате <i>json</i> будет представлен базовый набор информации.</p>
            <p>ФИО: <input type="text" name="fio"></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="contacts.jsp" method="post">
            <p>Сервис <b>contacts.jsp</b> формирует список контактов персоны по ее коду в базе ЕДБО.
                Параметр <b>personCodeU</b> - код персоны в базе данных ЕДБО.
                Результат - список контактов в формате json.</p>
            <p>Test: a8a274a4-c3cf-4561-bc48-c35ee396fa20 ;</p>
            <p>Код персоны: <input type="text" name="personCodeU"></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="getphoto.jsp" method="post">
            <p>Сервис <b>getphoto.jsp</b> загружает фото персоны по ее коду в базе ЕДБО.
                Параметр <b>personCodeU</b> - код персоны в базе данных ЕДБО.
                Результат - фото ы формате base64.</p>
            <p>Test: a8a274a4-c3cf-4561-bc48-c35ee396fa20 ;</p>
            <p>Код персоны: <input type="text" name="personCodeU"></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="documents.jsp" method="post">
            <p>Сервис <b>documents.jsp</b> формирует список документов персоны по ее коду в базе ЕДБО.
                Параметр <b>personCodeU</b> - код персоны в базе данных ЕДБО.
                Результат - список документов в формате json.</p>
            <p>Test: a8a274a4-c3cf-4561-bc48-c35ee396fa20 ;</p>
            <p>Код персоны: <input type="text" name="personCodeU"></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="olympiads.jsp" method="post">
            <p>Сервис <b>olympiads.jsp</b> формирует список идентификаторов олимпиад персоны по ее коду в базе ЕДБО.
                Параметр <b>personCodeU</b> - код персоны в базе данных ЕДБО.
                Результат - список список идентификаторов олимпиад в формате json.</p>
            <p>Test: a8a274a4-c3cf-4561-bc48-c35ee396fa20 ;</p>
            <p>Код персоны: <input type="text" name="personCodeU"></p>
            <input type="submit" value="Поиск">
        </form>
        <form action="benefits.jsp" method="post">
            <p>Сервис <b>benefits.jsp</b> формирует список идентификаторов льгот персоны по ее <i>идентификатору</i> в базе ЕДБО.
                Параметр <b>personId</b> - <i>идентификатор</i> персоны в базе данных ЕДБО.
                Результат - список список идентификаторов льгот в формате json.</p>
            <p>Test: 1417355 ;</p>
            <p>Код персоны: <input type="text" name="personId"></p>
            <input type="submit" value="Поиск">
        </form>
    </body>
</html>