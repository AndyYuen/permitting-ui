<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp" title="Solar Village Order Permitting Application - Order Permitting">

	<s:layout-component name="body">
	<s:errors />
	

<script type="text/javascript">

	$(function() {
		showStartProcessForm();
	});

    function showStartProcessForm() {

    	hideButtonsDiv();

        $("#startProcessDiv").html('<img src="images/loading.gif" border="0">');
        $("#startProcessDiv").show();
        // direct from server

        var formURL = "http://localhost:8080/kie-server/services/rest/server/containers/permitting_1.0.0-SNAPSHOT/forms/processes/permitting.PermitApplication/content?renderer=patternfly";
    	//alert("formURL: " + formURL);
        var html = "<iframe id='" + "startProcessDiv" + "_form' src='" + formURL + "' frameborder='0' style='width:100%; height:100%'></iframe>";
        $("#startProcessDiv").html(html);
        $("#startProcessDiv").show();

        // from saved html
        /*
        var html = "<iframe id='" + "startProcessDiv" + "_form' src='" + "process.html" + "' frameborder='0' style='width:100%; height:100%'></iframe>";
        $("#startProcessDiv").html(html);
        $("#startProcessDiv").show();
        */

    }

    // function to show the start process button
    function showButtonsDiv() {
        //document.getElementById("buttonsDiv").style.display = 'block';
    	$("#buttonsDiv").show();
    }

    // function to hide the start process button
    function hideButtonsDiv() {
        //document.getElementById("buttonsDiv").style.display = 'none';
    	$("#buttonsDiv").hide();
    }

</script>
<div>
	<div id="instructionDiv">
		<a href="#" onclick="showStartProcessForm();">Click here if Order Permitting Application Form does not appear</a><br><hr><br>
	</div>
	
    <div id="startProcessDiv" style="display: none; height: 600px; width: 800px;"></div>
    <div id="buttonsDiv" style="display: none;">
    	<input type="button" value="Submit Application" onclick="startProcess('startProcessDiv')"/>
	</div>

</div>

	</s:layout-component>
	
</s:layout-render>
