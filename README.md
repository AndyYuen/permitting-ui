# 1. permitting-ui
This is the web-based user interface for the 'Order Permitting' business process
```
https://github.com/AndyYuen/permitting
```

#2 Build the web UI 
1. Create and change to the github repository
  ```
  $ mkdir ~/github
  $ cd ~/github
  ```
2. Execute the git clone command:  

  ```
  $ git clone https://github.com/AndyYuen/permitting-ui.git
  ```
3. Build the services by executing 
  ```
  $ cd ~/github/permitting-ui
  $ mvn clean package
  ```Install the web UI onto EAP

Use the file manager to copy the file: 
```
~/github/permitting-ui/target/permitting-ui-1.0.war
``` 
to the 
```
jboss-eap-7.2/standalone/deployment
```
directory. On successful installation, you will see the file: 
```
permitting-ui-1.0.war.deployed
```
 in the jboss-eap-7.2/standalone/deployment directory
```

## 3. Run the UI.

The UI has been developed to allow the creation of new process instances and retrieve/action tasks.
Here is a pictorial introduction to the web UI.
Web UI Home
![Web UI Home](images/ui-home.png "Web UI Home")

Start Process
![Start Process](images/ui-startProcess.png "Start Process")

Show Task List
![Task List](images/ui-taskList.png "Task List")

Show Task Form to Action
![Task Form](images/ui-taskForm.png "Task Form")


