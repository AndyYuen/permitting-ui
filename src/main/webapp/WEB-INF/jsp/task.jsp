<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp" title="Solar Village Order Permitting Application - Task">

	<s:layout-component name="body">
	<s:errors />

<script type="text/javascript">

    var tasks;
    var currentTask;
    var myClass = ["\"even\"","\"odd\""];

    
    function loadTaskList() {
    	jQuery.support.cors = true;
        
        $.ajax({
                type: "GET",
                url: "http://localhost:8080/kie-server/services/rest/server/queries/tasks/instances/pot-owners?status=Ready&groups=rep",
                contentType: "application/xml; charset=utf-8",
                crossDomain: true,
                xhrFields: {
                    withCredentials: true
                },
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'Accept': 'application/xml',
                    'Authorization': 'Basic ' + btoa($("#currentUser").val() + ":" + $("#currentUserPassword").val())
                },
                beforeSend: function (xhr) {
                	//xhr.setRequestHeader( 'Authorization', 'Basic ' + btoa( 'ayuen:Wky16694' ) );
                    $("#listDiv").html('<img src="images/loading.gif" border="0">');
                    $("#listDiv").show();
                    $("#formDiv").show();
                    //alert("Executed beforeSend");
                },
                success:  function (xml) {
                	//alert("loadTaskList succeeded");
                	var result = $(xml).find("task-summary");
                	if (result.length) {
	                    tasks = new Object();
	
	                    var table = '<table id="taskList"><tr><th>Task Id</th><th>Task userName</th><th>Status</th><th>Action</th></tr>';

	                    var rows = '';
	                    var count = 0;
	
	                    result.each(function() {
	
	                        var task = {
	                            taskId: $(this).find("task-id").text(),
	                            name: $(this).find("task-name").text(),
	                            status: $(this).find("task-status").text()
	                        };
	
	                        tasks[task.taskId] = task;
							if (task.status != "Completed") {
		                        var row = '<tr class=' + myClass[count % 2] + ' >';
		                        row += '<td style="width: 15px;">' + task.taskId + '</td>';
		                        row += '<td>' + task.name + '</td>';
		                        row += '<td>' + task.status + '</td>';
		                        row += '<td><input type="button" value="Show task form" onclick="showTaskForm(' + task.taskId + ')"></td>';
		                        row += '</tr>';
		                        rows = row + rows;
		                        count += 1;
	                    	}
	                    });
	
	                    // if a task is being shown on the screen refresh buttons
	                    if (currentTask) {
	                        currentTask = tasks[currentTask.taskId];
	                        showHideButtons(currentTask.status);
	                    }
	
	                    table += rows + '</table>';
	                    $("#listDiv").html(table);
                	}

	            	else {
	            			$("#listDiv").html("<h2>The Task List is empty.</h2>");
		        	}

                },
                error: function(qXHR, textStatus, errorThrown) {
                    alert("failed: " + textStatus + " " + errorThrown);
                    var html = '<div id="errors"><h4>Warning!</h4>Something wrong happened, please try to reload the task list: ' + textStatus + "; " + errorThrown + "; " + 
                            '<a href="#" onclick="loadTaskList();">Refresh task list</a></div>';
                    $("#listDiv").html(html);
                }
        });
    }

    function showTaskForm(taskId) {
    	//alert(document.getElementById("currentUser").value);
        currentTask = tasks[taskId];

        if (currentTask) {
        //alert(hostURL + " - " +  taskId);
            $("#formDiv").html('<img src="images/loading.gif" border="0">');
            $("#formDiv").show();
            var formURL = "http://localhost:8080/kie-server/services/rest/server/containers/permitting_1.0.0-SNAPSHOT/forms/tasks/" +
              taskId + "/content?renderer=patternfly";

                	//alert("taskURL: " + formURL);
                    var html = "<iframe id='" + "formDiv" + "_form' src='" + formURL + "' frameborder='0' style='width:100%; height:100%'></iframe>";
                    $("#formDiv").html(html);
                    $("#formDiv").show();           
        }

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

	$(function() {
		//alert("loadTaskList: " + document.getElementById("currentUser").value);
		hideButtonsDiv();
		loadTaskList();
	});
</script>
<s:form beanclass="com.redhat.bpms.webapp.action.TaskActionBean">
			<s:hidden name= "user" id="currentUser" value="\${actionbean.user}" />
			<s:hidden name= "password" id="currentUserPassword" value="\${actionbean.password}" />

<div>
    <div id="listDiv"></div>

    <hr />

            <div id="formDiv" style="display: none; height: 600px; width: 800px;" ></div>
		    <div id="buttonsDiv" style="display: none;">
		        <input type="button" value="Claim Task" id="claim" onclick="claimTask('formDiv');"/>
		        <input type="button" value="Start Task" id="start" onclick="startTask('formDiv');"/>
		        <input type="button" value="Release Task" id="release" onclick="releaseTask('formDiv');"/>
		        <input type="button" value="Save Task" id="save" onclick="saveTask('formDiv');"/>
		        <input type="button" value="Complete Task" id="complete" onclick="completeTask('formDiv');"/>
		    </div>

</div>

</s:form>

	</s:layout-component>
	
</s:layout-render>
