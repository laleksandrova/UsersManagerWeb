<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<t:layout>
    <jsp:attribute name="title">Login</jsp:attribute>
    <jsp:attribute name="head"></jsp:attribute>
    <jsp:body>
        <form action="/home/login" method="post">
            <div style="text-align: center">
                <h1>Admin Login</h1>
                <form action="login" method="post">
                    <label>Username:</label>
                    <input type="text" name="username" size="30" value="${model.username}"/>
                    <br><br>
                    <label>Password:</label>
                    <input type="password" name="password" size="30" value="${model.password}"/>
                    <br><br>
                    <button type="submit" style="background-color:lightgreen;">Login</button>
                </form>
            </div>
        </form>
    </jsp:body>
</t:layout>