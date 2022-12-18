<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="../../styles/header.css">
    </head>
    <body>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <div class="navbar-brand navbar-brand-centered">Lections 7-8</div>
            </div>

            <div  id="navbar-brand-centered">
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${sessionScope.isLoggedIn == null || sessionScope.isLoggedIn == false }">
                        <li><a href="/login">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.isLoggedIn == true}">
                        <li><a href="/users">Users list</a></li>
                        <li class="form-li">
                            <form action="logout" method="post">
                                <button class="btn btn-link" type="submit">Log out</button>
                            </form>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    </body>

    <style>
        body {
        font-family: "Lato", sans-serif;
        color: #000;
        }

        .navbar-brand-centered {
        position: absolute;
        left: 50%;
        display: block;
        width: 160px;
        text-align: center;
        background-color: transparent;
        }
        .navbar>.container .navbar-brand-centered,
        .navbar>.container-fluid .navbar-brand-centered {
        margin-left: -80px;
        }

        .navbar {
        padding-top: 5px;
        }

        .navbar a {
        transition: 0.25s;
        }
        .navbar a:hover {
        bottom-border: 2px solid #000;
        }
        form {
            float: left;
        }
        .form-li {
            margin-top: 7px;
        }
    </style>
</html>