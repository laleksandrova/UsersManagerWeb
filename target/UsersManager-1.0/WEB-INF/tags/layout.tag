<%@ tag description="Layout" pageEncoding="UTF-8" %>
<%@ attribute name="title" fragment="true" %>
<%@ attribute name="head" fragment="true" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title><jsp:invoke fragment="title"/></title>
    <jsp:invoke fragment="head"/>
</head>
<body>
<div>
    <table>
        <tr>
            <td>
                <h1 style="font-size:26px;"><jsp:invoke fragment="title"/></h1>
            </td>
        </tr>
        <tr>
            <td>
                <ul style="list-style:none;">
                    <li style="float: left; width: 150px; text-decoration:none; color:black;"><a href="/user/index">Manage Users</a></li>
                    <c:if test="${sessionScope.loggedUser eq null}">
                        <li style="float: left; width: 150px; text-decoration:none; color:black;"><a href="/home/login">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.loggedUser ne null}">
                        <li style="float: left; width: 150px; text-decoration:none; color:black;"><a href="/home/logout">Logout</a></li>
                    </c:if>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <jsp:doBody/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>