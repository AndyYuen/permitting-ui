<%@page contentType="text/html;charset=ISO-8859-1" language="java"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<s:layout-definition>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
  <html>
    <head>
      <title>${title}</title>
      <link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css" />
      <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>

    <body>
      <div id="panel">
        <div id="header">
          <span class="title">${title}</span>
          <span class="menu">
            <s:layout-component name="menu">
            </s:layout-component>
          </span>
        </div>

        <s:messages/>

        <div id="body">
          <s:layout-component name="body">
          </s:layout-component>
        </div>

        <div class="clear"></div>

<%--         <div id="footer">
          <s:layout-component name="footer">
          <a href="mailto:ayuen@redhat.com">Send Author an Email</a>
          </s:layout-component>
        </div> --%>
      </div>
    </body>
  </html>
</s:layout-definition>
