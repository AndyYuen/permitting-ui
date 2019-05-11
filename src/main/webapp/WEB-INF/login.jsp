<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp" title="Solar Village - Login">

	<s:layout-component name="body">

	<s:errors />
	<s:form beanclass="com.redhat.bpms.web.LoginActionBean" focus="">
	<table>

					<tr>
							<td>User: </td><td><s:text name="user"/></td>
					</tr>
					<tr>
							<td>Password: </td><td><s:password name="password"/></td>
					</tr>
		
					<tr>
                			<td  colspan="2">
                				<s:submit name="cancelLogin" value="Cancel"/>
                				<s:submit name="submitLogin" value="Submit"/>
                			</td>
            		</tr>

	</table>
	You may use the following credentials to login: <br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ayuen</strong>/<strong>password</strong>
	</s:form>

	</s:layout-component>
	
</s:layout-render>