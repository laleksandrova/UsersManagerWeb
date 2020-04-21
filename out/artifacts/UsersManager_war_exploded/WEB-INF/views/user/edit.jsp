<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<t:layout>
    <jsp:attribute name="title">Edit User</jsp:attribute>
    <jsp:attribute name="head"></jsp:attribute>
    <jsp:body>
        <form action="/user/edit" method="post">
            <input type="hidden" name="Id" value="${model.id}" />
            <fieldset>
                <legend>Edit User</legend>
                <table>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="FirstName" value="${model.firstName}" /></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="LastName" value="${model.lastName}" /></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="Username" value="${model.username}" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="Password" value="${model.password}" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Save" />&nbsp;<a href="/user/index">Cancel</a></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </jsp:body>
</t:layout>