<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="test" value="?"/>
<c:forEach var="par" items="${param}">
    <c:if test="${par.key != 'prefix' && par.key !=  param.prefix.concat('.page') && par.key !=  param.prefix.concat('.pageSize')}">
        <c:set var="test" value="${test.concat(par.key).concat('=').concat(par.value).concat('&')}" />
    </c:if>
</c:forEach>
<script>
    function ddlPageSize_OnChange() {

        var params = "${test}";
        var address = "/user/index" + params + "${param.prefix}.page=${model.pager.page}&${param.prefix}.pageSize=" + document.getElementById("${param.prefix}_ddlPageSize").value;

        window.location.href = address;
    }
</script>
<ul style="list-style:none;">
    <c:forEach var="i" begin="1" end="${model[param.prefix].pagesCount}">
        <li style="float:left; width:30px; text-decoration:none; color:black;">
            <a href="/${model.controller}/${model.action}${test}${param.prefix}.page=${i}&${param.prefix}.pageSize=${model[param.prefix].pageSize}">${i}</a>
        </li>
    </c:forEach>
</ul>
<select id="${param.prefix}_ddlPageSize" onchange="ddlPageSize_OnChange()">
    <option ${model[param.prefix].pageSize == 10 ? 'selected' : ''} value="10">10</option>
    <option ${model[param.prefix].pageSize == 50 ? 'selected' : ''} value="50">50</option>
    <option ${model[param.prefix].pageSize == 100 ? 'selected' : ''} value="100">100</option>
</select>