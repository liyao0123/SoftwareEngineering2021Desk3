## Sprints & Project Management
### Group working methods:
#### Agile - Kanban
In order to promote our communication, collaboration and flexibility, we considered Agile as our software development approach instead of traditional waterfall approach. There are mainly two frameworks namely Kanban and Scrum for our team to use. We choose Kanban as our primary management tool since it can help us visualize our work, maximizing the efficiency and meanwhile generate continuous flow of work.
#### Communication channels – Jira and Teams
We choose Jira Software as our tool to utilise Kanban, which provide a clear and straightforward Kanban board for us to be aware of the progress of the project and what to do for each member. Therefore, we can balance the workload easily for our team members.  
In addition, we use Microsoft Teams as our communicating tool for weekly meeting. Except for meeting, it is inevitable that we have some issue to discuss. Under the circumstance, we choose Wechat which is convenient for all of us to discuss problems.
### Summary of individual contributions:
**Yunqi Guo:** 1)Develep the Dynamic earth. 2)Time magement. 3)Modify the syntax of the report.

**Yao Li:** 1) deploy the Game Home system, mysql database, dynamic earth server through docker, write the related atuomated deployment script. 2) write the documentation of deployment instructions and details. 

**Haojie Xin:** 1) work with Yao to develop the Game Home system including building database, dealing with requests in back end, deploying the whole project on the server. 2) work with Jiahao to design the front-end page. 3) finish the documentation of system implementation and evaluation.

**Xiaojun Huang:**

**Wang Jiahao:**

### Documentation of sprints and meeting logs:
Although there is no strict sprint for Kanban conceptually, we intentionally separate several sprints for our project in order to maintain a desirable cadence. Moreover, we use a Gantt chart as our roadmap to keep the trace of our project, which is demonstrated below.

![Gantt](GanttChart.jpg)

#### Sprints:
##### Sprint 0: Preparation for the project

###### Timeline: 9/2/2021 - 25/2/2021  
###### Task finished:
* A serious real-word problem namely protecting endangered animals.

* The idea of a playful mini game to help address the problem.

* Role allocation
* Background information collection

##### Sprint 1:
###### Timeline: 1/3/2021 - 28/3/2021  

###### Task finished:
* Project proposal – finishing the proposal and commit it to our repository.  

* Paper prototyping – the initial design of the layout and interaction of our website
* Data preparation – collecting the endangered animal’s information including distribution, description and treats, and then normalising these data.
* Leaning of related technical knowledge about tools and frameworks we are going to use such as Spring and Docker.

##### Sprint 2: First release of our website  
###### Timeline: 1/4/2021 - 15/4/2021  

###### Task finished:

* First webpage which shows a 3D earth that is draggable, and there are interactable points on the earth.

* Build the database and connect it to backend.

###### User stories accomplished:  

* A user can see a dynamic 3D earth which is draggable on the website.

* There are some luminous points on the earth, and by using cursor to hover in a point, a user can preview the name and appearance of the endangered animal.

##### Sprint3: Show detailed information of animals and mini game

###### Timeline: 16/4/2021 - 30/4/2021  

###### Task finished:

* Be able to deploy the project using Docker

* More detailed information provided in the webpage
* Provide an interactive game for users to play

###### User stories accomplished:
* A user can click the luminous points to access more detailed information about animals including distribution, description, threats and the link to Wikipedia.

* A user can play a mini game to test whether he understand the distribution of endangered animals and also consolidate the memory. The user should choose the right distribution area of a animal. Finally, a score and accuracy rate will be given according to the user’s choice.

##### Sprint4: Evaluation
###### Timeline: 16/4/2021 - 30/4/2021  

##### 1. Method - questionnaires
 - Did you encounter bugs while browsing our game home page or dynamic earth?
 - Do you have any suggestions about the layout of our website?
 - Are you satisfied with the theme and content?
 - Do you enjoy interactions way of our web application?
 - What improvements would you like to see on our web?

The above are some question when we do user testing. More details could be seen here. [Questionnaires file](https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/5f4c293bfebcdbe7b532e149d697afad6767ab16/Documentation/docs/ques.md)

##### 2. History, Findings and implications
**Game Home version1:**

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/61a3a6787db5abf2524a7bcfdd23432965e9812d/application/static/images/game1_v1.png" width="900" height="500">
 
 - **User Yanliang:** The warning words of game are not friendly. The question in button seems redundant because it could not be clicked. We make it more friendly according to this feedback. The first version is "wrong and right". 
 - The latter version would show "bingo, or it should be xxx". In addition, we remove the button of question but leave a words only.

**Game Home version2:**

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/61a3a6787db5abf2524a7bcfdd23432965e9812d/application/static/images/carousel_v2.png" width="900" height="500">
 
 - **User Yuwei:** The carousel layout seems a little deformed. In fact, besides Yuwei, all members in our team complain the carousel all the time. 
 - We repeat the pictures in x-axis in version1. Then we cover it in the whole background with two fauna in one picture. Finally, we decide to find some beautiful and HD images to put. It looks better.

**Game Home version3:**

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/61a3a6787db5abf2524a7bcfdd23432965e9812d/application/static/images/game_3.png" width="900" height="500">
 
 - **User Yiran:** The hint should be hided and be showed when there is a click event. The learn more link should be opened in new tag and leave the game page. 
 - We add a onclick function to hide and display the hint content according to this feedback and revise the open method of learn more<a> tag.

**Dynamic Earth version1:**

 <img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/af5e46cf2e33f0f6d294a2882590314e2d3ce7fc/Documentation/pics/earth_v1.png" width="900" height="500">
 
 - **User Jiaqi:** it is better if the dynamic earth rotates itself. The descriptions are too long. 
 - We add this self-rotate interaction way in our dynamic earth version2. In addition, improve the layout of information window and decorate the background color to make the content more clear. The version2 would show below.

**Dynamic Earth version2:**
<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/af5e46cf2e33f0f6d294a2882590314e2d3ce7fc/Documentation/pics/earth_v2.png" width="900" height="500">

## Team use of Git, continuous integration / continuous deployment.
Our team has adopted a fairly intuitive git workflow consisting of **main**, **development**, **deployment** branches.

The **main** branch was essentially a working master branch where all of the team members would merge their branches.

In the event of a new feature to be added, the relevant team member would perform the following standard workflow:
1. Perform the necessary code commits on the **development** branch.
2. Merge the most recent commit on the **development** branch into **deployment** branch and commit automated deployment scripts on **deployment** branch.
3. Merge commit into the **main** branch and repeat with the next feature.

Docker is a great way to create a consistent runtime environment for our application. It ensures that when we bundle up our project for other team members to compile and test we know the conditions present at runtime. The use of Docker helped provide a consistent working environment for our application and OS-specific issues were avoided. The application and all its dependencies can be bundled into containers that are independent from the host version of Linux kernel, platform distribution, or deployment model. Those containers can be transfered to another machine that runs Docker, and executed there without compatibility issues.When a new feature was added to the application, the corresponding automated deployment scripts was commit to achieve continuous deployment.

To summarize our streamlining of workflow throughout:
<p align="center">
  <img src="/Documentation/pics/workflow.png" width="300"/>
</p>



#### Meeting logs  
We almost hold a meeting everyweek. To view out meeting minutes, click the link below please.  
[9/2/2021](MeetingLogs/9.2.2021.md)  
[16/2/2021](MeetingLogs/16.2.2021.md)  
[25/2/2021](MeetingLogs/25.2.2021.md)  
[9/3/2021](MeetingLogs/9.3.2021.md)  
[18/3/2021](MeetingLogs/18.3.2021.md)  
[25/3/2021](MeetingLogs/25.3.2021.md)  
[9/4/2021](MeetingLogs/9.4.2021.md)  
[20/4/2021](MeetingLogs/20.4.2021.md)    
[24/4/2021](MeetingLogs/24.4.2021.md)  
[27/4/2021](MeetingLogs/27.4.2021.md)  
[28/4/2021](MeetingLogs/28.4.2021.md)     
[1/5/2021](MeetingLogs/1.5.2021.md)     
[2/5/2021](MeetingLogs/2.5.2021.md)     
[3/5/2021](MeetingLogs/3.5.2021.md)     
[6/5/2021](MeetingLogs/6.5.2021.md)   
[8/5/2021](MeetingLogs/8.5.2021.md)   
[13/5/2021](MeetingLogs/13.5.2021.md)
