<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp" title="Solar Village Order Permitting Application - Home">
	
	<s:layout-component name="body">
	<div style="width:100%; height:40%;">
	<p />The web application is the front-end for the Solar Village Order Permitting business process. The menu items include:<br>
	<p />
	<ul>
	<li>Home - displays this screen</li>
	<li>Order Permitting - allows you to start an instance of business process</li>
	<li>Task - lists the tasks that you can work on, click on the action to complete a task via a task form</li>
	<li>Logout - only shows if you have already logged in to the application</li>
	</ul>
	<p />
	</div>
	<br><hr>

	
	</s:layout-component>
	
</s:layout-render>