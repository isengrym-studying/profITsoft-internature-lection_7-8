<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Users</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <table>
            <tr>
                <th>Num.</th>
                <th>Email</th>
                <th>Name</th>
            </tr>
            <c:forEach var="user" items="${users}" varStatus="i">
                <tr>
                    <th><c:out value=" ${i.count}" /></th>
                    <th><c:out value=" ${user.getLogin()}" /></th>
                    <th><c:out value=" ${user.getName()}" /></th>
                </tr>
            </c:forEach>
        </table>
    </body>

    <style>
        body {
            font-family: 'Source Sans Pro', sans-serif;
            font-size: 14px;
            color: #787D80;
            letter-spacing: .2px;
        }

        .container {
            width: 950px;
            margin: auto;
        }

        .filterBar {
            margin: 20px 0px;
        }

        label {
            font-weight: 600;
            text-transform: uppercase;
        }
        table {
            width: 100%;
        }

        th, td {
            padding-top: 15px;
            padding-bottom: 15px;
            padding-left: 15px;
        }

        th {
            text-align: left;
            background-color: #F2F2F2;
            color: #65696B;
        }

        tr:nth-child(odd) {
            background: #F9F9F9;
            border-top: 1px solid transparent;
            border-left: 1px solid transparent;
        }

        tr:nth-child(even) {
            background: #FFF;
            border-top: 1px solid transparent;
            border-left: 1px solid transparent;
        }

        tr:hover {
            background-color: #EBF5FB;
            cursor: default;
            border: 1px solid #67B2E4;
        }
    </style>
</html>
