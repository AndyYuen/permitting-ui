package com.redhat.bpms.security;



import com.redhat.bpms.webapp.action.LoginActionBean;

import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.controller.ExecutionContext;
import net.sourceforge.stripes.controller.Interceptor;
import net.sourceforge.stripes.controller.Intercepts;
import net.sourceforge.stripes.controller.LifecycleStage;

@Intercepts(LifecycleStage.HandlerResolution)
public class SecurityInterceptor implements Interceptor {

	public Resolution intercept(ExecutionContext ctx) throws Exception {
		System.out.println("Entering " + ctx.getLifecycleStage());
		
        Resolution resolution = ctx.proceed();
        //System.out.println("Intercepted Resolution: " + resolution);
        Class bean = ctx.getActionBean().getClass();
        if (bean.isAnnotationPresent(NoLoginRequired.class)) {
        	System.out.println("Class has @NoLoginRequired: " + bean.getName());
        	return resolution;
        }
        
        if (isLoggedIn(ctx.getActionBeanContext())) {
        	System.out.println("Already logged in: " + bean.getName());
			if (ctx.getActionBeanContext().getRequest().getUserPrincipal() == null) {
				System.out.println("User Principal is null");
			}
        	return resolution;
        }

        System.out.println("Not logged in: " + bean.getName() + " redirected to login page");
        //System.out.println("Resolution to save: " + resolution);
        ctx.getActionBeanContext().getRequest().getSession().setAttribute("targetActionBean", bean);
        return new RedirectResolution(LoginActionBean.class);

	}
	
	private boolean isLoggedIn(ActionBeanContext ctx) {
		String user = (String) ctx.getRequest().getSession().getAttribute("user");
		if (user != null) {
			return true;
		}
		/*
		if (ctx.getRequest().getUserPrincipal() != null) {
			return true;
		}
		*/
		return false;
	}

}
