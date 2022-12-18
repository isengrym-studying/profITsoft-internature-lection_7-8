<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <title>Log in</title>
    </head>
    <body>
        <div class="sidenav">
            <div class="login-main-text">
                <h2>Log in page</h2>
                <p>Type your email and password to log in and get full access to our website (there is no functionality except authentication but anyway)</p>
            </div>
        </div>

        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">

                    <form action="login" method="post">

                        <div class="form-group">
                            <label>Email</label>
                            <input name="login" type="text" required class="form-control" placeholder="johnmarston">
                            </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input name="password" type="password" class="form-control" placeholder="********">
                        </div>
                        <button type="submit" class="btn btn-black">Log in</button>

                        <c:if test="${not empty loginError}">
                            <div class="error-block">
                                <h5>Wrong email or password was given. Please try again</h5>
                            </div>

                        </c:if>
                    </form>

                </div>
            </div>
        </div>

        <br/>
    </body>

    <style>
        body {
        font-family: "Lato", sans-serif;
        }

        .sidenav {
        height: 100%;
        background-color: #000;
        overflow-x: hidden;
        padding-top: 20px;
        }


        .main {
        padding: 0px 10px;
        }

        @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        }

        @media screen and (max-width: 450px) {
        .login-form{
        margin-top: 10%;
        }

        }

        @media screen and (min-width: 768px){
        .main{
        margin-left: 40%;
        }

        .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        }

        .login-form{
        margin-top: 70%;
        }

        }


        .login-main-text{
        margin-top: 20%;
        padding: 60px;
        color: #fff;
        }

        .login-main-text h2{
        font-weight: 300;
        }

        .btn-black{
        background-color: #000 !important;
        color: #fff;
        transition: 0.15s;
        }
        .btn-black:hover {
        background-color: #000 !important;
        color: #fff;
        transform: scale(1.04);
        }

        .error-block {
        margin-top: 20px;
        background-color: red;
        color: white;
        border-radius: 10px;
        padding: 5px 10px;
        }
    </style>
</html>