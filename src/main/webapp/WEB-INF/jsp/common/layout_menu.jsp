<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-definition>
  <s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
    title="${title}">
	<s:layout-component name="menu">
	<s:link href="${contextPath}">Home</s:link> |
<%-- 	<s:link href="${contextPath}/Quote.action">Quote</s:link> | --%>
	<s:link href="${contextPath}/OrderPermittingApplication.action">Start New Order Permitting Request</s:link> |
	<s:link href="${contextPath}/Task.action">Task</s:link>
	
	<c:if test="${user != null}">	
		| <s:link href="${contextPath}/Login.action" event="logout">Logout</s:link>
	</c:if>
	</s:layout-component>
	
    <s:layout-component name="body">${body}</s:layout-component>
  </s:layout-render>
</s:layout-definition>
