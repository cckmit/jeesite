<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>自动投药管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/auto/wqAutoTy/">自动投药列表</a></li>
		<shiro:hasPermission name="auto:wqAutoTy:edit"><li><a href="${ctx}/auto/wqAutoTy/form">自动投药添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="wqAutoTy" action="${ctx}/auto/wqAutoTy/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>站点名称：</label>
				<form:input path="zdName" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>站点名称</th>
				<th>站点类型</th>
				<th>所属水厂</th>
				<shiro:hasPermission name="auto:wqAutoTy:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="wqAutoTy">
			<tr>
				<td><a href="${ctx}/auto/wqAutoTy/form?id=${wqAutoTy.id}">
					${wqAutoTy.zdName}
				</a></td>
				<td>
					${wqAutoTy.zdTypeid}
				</td>
				<td>
					${wqAutoTy.scId}
				</td>
				<shiro:hasPermission name="auto:wqAutoTy:edit"><td>
    				<a href="${ctx}/auto/wqAutoTy/form?id=${wqAutoTy.id}">修改</a>
					<a href="${ctx}/auto/wqAutoTy/delete?id=${wqAutoTy.id}" onclick="return confirmx('确认要删除该自动投药吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>