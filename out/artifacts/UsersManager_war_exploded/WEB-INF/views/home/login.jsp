<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<t:layout>
    <jsp:attribute name="title">Login</jsp:attribute>
    <jsp:attribute name="head"></jsp:attribute>
    <jsp:body>
        <form action="/home/login" method="post">
            <fieldset>
                <legend>Login</legend>
                <table>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="${model.username}" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="password" value="${model.password}" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Login" /></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </jsp:body>
</t:layout>