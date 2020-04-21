<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<t:layout>
    <jsp:attribute name="title">Manage Users</jsp:attribute>
    <jsp:attribute name="head"></jsp:attribute>
    <jsp:body>
        <form action="/user/index" method="get">
            Username: <input type="text" name="filter.username" value="${model.filter.username}" />
            First Name: <input type="text" name="filter.firstName" value="${model.filter.firstName}" />
            Last Name: <input type="text" name="filter.lastName" value="${model.filter.lastName}" />
            <c:forEach var="par" items="${param}">
                <c:if test="${par.key != 'pager.page' && par.key != 'filter.username' && par.key != 'filter.firstName' && par.key != 'filter.lastName'}">
                    <input type="hidden" name="${par.key}" value="${par.value}" />
                </c:if>
            </c:forEach>
            <input type="button" value="Clear" onclick="window.location.href='/user/index'" />
            <input type="submit" value="Filter" />
        </form>
        <a href="/user/edit">Create new</a>
        <table>
            <tr>
                <td>Username</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${model.items}" var="item" >
                <tr>
                    <td>${item.username}</td>
                    <td>${item.firstName}</td>
                    <td>${item.lastName}</td>
                    <td><a href="/user/edit?id=${item.id}">edit</a></td>
                    <td><a href="/user/delete?id=${item.id}">delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <jsp:include page="/WEB-INF/views/shared/pager.jsp">
                <jsp:param name="prefix" value="pager"/>
            </jsp:include>
        </div>
    </jsp:body>
</t:layout>