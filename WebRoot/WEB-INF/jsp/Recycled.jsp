<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/CSS/public/main.css">
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/CSS/draftBox.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/tool/span.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.10.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/tool/JQ_Scroll_Plub.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/plugObject/Texi.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/plugObject/notice.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/tool/JQ_plugs.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JS/recycled.js"></script>
		<title>${sgin}_的回收站</title>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/head.jsp"%>
		<div class="draftBox">
			<h2 class="draft_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回收站&nbsp;(&nbsp;<span><s:property value="#userlogs.size()"/> </span>&nbsp;)<a href="${pageContext.request.contextPath}/user/space/${sgin}/">返回空间</a></h2>
			<hr style="width:750px;margin:20px auto 0;border:1px solid #9EC8F5;">
			<div class="draftRow">
				<ul>
					<s:iterator value="#userlogs" var="log">	
						<li><b style="width:460px;"><s:property value="logName" default="未命名"/><s:property value="draft==0?' -- (发布)':' -- (草稿)'" /></b>
						<a  class="recovery"  title="<s:property value="id" />">回收</a>
						<a class="delectDraft" title="<s:property value="id" />">删除</a><span><s:property value="modifyDate.getMonth()+1"/>
						-<s:property value="modifyDate.getDate()"/> 
						<s:property value='modifyDate.getHours()<10? "0" +modifyDate.getHours():modifyDate.getHours()'/>:
						<s:property value='modifyDate.getMinutes()<10? "0" +modifyDate.getMinutes():modifyDate.getMinutes()'/></span></li>
					</s:iterator>
				</ul>
			</div>
		</div>
	</body>
</html>