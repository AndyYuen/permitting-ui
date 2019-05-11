package com.redhat.bpms.webapp.action;

import net.sourceforge.stripes.exception.DefaultExceptionHandler;

//import org.jbpm.services.task.exception.PermissionDeniedException;
//import org.kie.services.client.api.command.exception.RemoteApiException;

public class BpmsExceptionHandler extends DefaultExceptionHandler {
	
	private static final String ERROR_PAGE = "/permissionError.jsp";
	
/*	public Resolution handleBpmsPermissionException(PermissionDeniedException exc, HttpServletRequest request, HttpServletResponse response) {
        // do something to handle SQL exceptions
        return new ForwardResolution(ERROR_PAGE);
    }
	
	public Resolution handleBpmsRemoteApiException(RemoteApiException exc, HttpServletRequest request, HttpServletResponse response) {
        // do something to handle SQL exceptions
        return new ForwardResolution(ERROR_PAGE);
    }*/
}
