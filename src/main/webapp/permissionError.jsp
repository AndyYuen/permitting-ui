<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp" title="Solar Village Order Permitting Application - Error">

	<s:layout-component name="body">
	<h2>Error working with the Remote BPMS Server using the Remote Java API</h2> 
	<p>
	Unable to complete/release task. Someone may be working on the same task. <br>Refresh the 
	task list and try again. If problem persists, you may have to log in to the BPMS Execution Server 
	and release the task from the Task menu.
	</p>
	</s:layout-component>
</s:layout-render>