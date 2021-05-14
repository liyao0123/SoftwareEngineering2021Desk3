<h1 align="center">
Endangered Fauna World Window
<br>
<br>
<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/main/Documentation/pics/logo.jpg" width = "28%" />
<br>

[Game Entrance](https://github.com/liyao0123/SoftwareEngineering2021Desk3/tree/development)
</h1>

## SoftwareEngineering2021Desk3 Team Members

Name          |Yunqi Guo            |Jiahao Wang           | Haojie Xin           |Xiaojun Huang         |Yao Li
:------------:|:-------------------:|:--------------------:|:--------------------:|:--------------------:|:-----------------------:
Student number|wb20529              |lo20331               |tz20505               |we20979               |of20548   
Roles         |Leader               |Front-end             |Back-end              |Back-end              |Back-end    
Photo         |<img src="Documentation/pics/Yunqi_Guo.jpg" width="130" height="110">|<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/Xiaojun.JPG" width="130" height="110">|<img src="Documentation/pics/YaoLi.jpg" width="130" height="110">


## Introduction - 10
Biodiversity is an essential attribute of our ecosystem. It provides a rich life and boosts ecosystem productivity which plays such a vital role for our earth. Therefore it is beneficial to gain more knowledge about the protection of endangered animals all over the world.

In this project, we want to design a single-page application to help people recognize endangered animals in the wild while promoting environmental protection awareness. This project isn't like a pure E-library, which is only full of information about endangered animals and could offer exciting interactions between the web page and users. A pleasing appearance of the web page and multi ways for user's exchange could be a good way for promoting this knowledge.

By making such a web page, we want to promote the idea of protecting endangered animals more accessible and more exciting and raising the awareness of protecting animals and animals in people when they browse the web page.

More details -> [introduction document](Documentation/Introduction.md).


## Background and Motivation - 10
- Background literature. Academic research review.
- State of the art survey. Current industry review.
- Clear definition of the problem. How does your project relate to the above? We will be marking the ability of your team to identify a worthwhile and important problem and clearly articulate the scope and challenge of the problem.

More details -> [background and motivation document](Documentation/BackgroundandMotivation.md).


## System Implementation - 20
- Stack architecture
- Database - MySQL
- Back End - SpringBoot
- Front End - Thymeleaf and Bootstrap
- Additional elements and components
- Deployment details

More details -> [system implementation document](Documentation/SystemImplementation.md).


## UX Design - 15
In this part, we demonstrate the UX design process, which includes:
- **Research:** Questionnaires, Interviews
- **Analysis:** Interacting users, Persona, Stakeholder analysis, User story
- **Design:** Mood boards, Wireframes, Interaction flow diagrams, Prototype

More details ->  [UX design document](Documentation/UXDesign.md).

## Sprints & Project Management - 15

- The group working methods we used: Jira and Teams
- Summary of individual contributions
- Documentation of sprints
- Our meeting logs
- Team use of Git

More details -> [sprints and project management document](Documentation/Sprints&ProjectManagement.md).


## Evaluation - 15
- Designs and Techniques and Comparison with MEAN
- Unit testing
- User acceptance testing

More details -> [evaluation document](Documentation/Evaluation.md).

## Conclusion - 10
- **Working practices:** Meeting and Communication, Plan and Timeline Design, Implementation Capacity
- **Success discussion :** Goals Achievement, Web Functionality, Web Design and Team Work Success
- **Covid Impacts :** Remotely Corroboration, Team relationship
- **Social and Ethical Implications**
- **Future Work :** Web Frame, Pictures Quality, Interactions Improvement, Summary

More details -> [conclusion ducument](Documentation/Conclusion.md).


# Quick Start

## prerequisite: Git and Docker are needed to deploy this application.

#### It takes 4 steps:
1. git clone this project to Linux file system   
  `git clone https://github.com/liyao0123/SoftwareEngineering2021Desk3.git`
2. change directory into the application folder   
  `cd SoftwareEngineering2021Desk3/application`
3. modify the variables defined in env.env, or leave it if you just want to test this application locally.   
   If you want to deploy this project with a remote server, you need to do two things.   
   1)change the host in the env.env file with your server IP   
   2)add a security group rule and open the 3000 port so that you could load our dynamic earth. 
4. run bash build.sh file 
  `./build.sh`

It may take **3 or 4 minutes** until the application up because downloading the dependencies needs some time.
The procedures have been tested both in Win10 and CentOS.
More details about the deployment procedures can be found in [DeploymentDetail.md](/application/DeploymentDetail.md)
