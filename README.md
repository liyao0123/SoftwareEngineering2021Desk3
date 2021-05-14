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
Photo         |<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/Haojie_Xin.jpeg" width="130" height="110">|<img src="Documentation/pics/YaoLi.jpeg" width="83" height="110">


## Introduction - 10
Biodiversity is really an important attribute of our ecosystem. It provides a rich life and boots ecosystem productivity which plays such an important role in our earth. Therefore it is beneficial if we could gain more knowledge pertain with protection of the endangered animals all over the world.   
<br>
In this project we want to design a single page application to help people to recognize endangered animals in the wild meanwhile promoting their awareness in environmental protection.This project isn't like a pure E-library which is only full of information about endangered aninmals, but also could offer interesting interacions between the web page and users. A good appearance of the web page and multi ways for user's interaction could be a good way for promoting these knowledge.   
<br>
By making such a web page, we want to make the way of promoting the idea of protecting endangered animals easier and more interesting. Raising up the awareness of protecting animals and animals in people when they browse web page.

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
- Research: Questionnaires; Interviews
- Analysis: Interacting users; Persona; Stakeholder analysis; User story
- Design: Mood boards; Wireframes; Interaction flow diagrams; Prototype

More details ->  [UX design document](Documentation/UXDesign.md).

## Sprints & Project Management - 15

- The group working methods we used: Jira and Teams
- Summary of individual contributions
- Documentation of sprints
- Our meeting logs
- Team use of Git

More details -> [sprints and project management document](Documentation/Sprints&ProjectManagement.md).


## Evaluation - 15
- Description of techniques suitable for your particular design. Why we choose a new stack? A timeline of evaluation of your design.
- Unit testing.
- User acceptance testing.

More details -> [evaluation document](Documentation/Evaluation.md).

## Conclusion - 10
- Reflect on the working practices of your group, how well they did or did not work, e.g, management of issues, communication, Agile (etc).
- Reflective discussion of the success of the project. How well did your project fulfil the brief? Were all of your own objectives met
- This is a chance to reflect on how coronavirus has affected your project (remote working practices etc)
- Discussion of Social and Ethical implications of your work.
- Discussion of future work (in terms of design, development and evaluation)

More details -> [conclusion ducument](Documentation/Conclusion.md).


# Quick Start

## prerequisite: Git and Docker are needed to deploy this application.

#### It takes 4 steps:
1. git clone this project to linux file system   
  `git clone https://github.com/liyao0123/SoftwareEngineering2021Desk3.git`
2. change directory into the application folder   
  `cd SoftwareEngineering2021Desk3/application`
3. modify the variables defined in env.env, or leave it as it is if you just want to test this application locally.   
   If you want to deploy this project with a remote server, you need to do two things.   
   1)change the host in env.env file as your own server ip   
   2)add a security group rule and open the 3000 port so that you could load our dynamic earth. 
4. run bash build.sh   
  `./build.sh`

It may take 3 or 4 minutes unitl the application up.
The procedures have been tested both in Win10 and Centos.
More details about the deployment procedures can be found in [DeploymentDetail.md](https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/7f2b5602bb60a1aef26122f0c8067718ccc6b019/application/DeploymentDetail.md)
