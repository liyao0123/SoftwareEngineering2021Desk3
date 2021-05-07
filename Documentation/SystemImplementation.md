# 1. Stack architecture

## 1.1 Mind Diagram   
<img src="Documentation/pics/efww_diagram.jpeg" width="800" height="450"/></br>

## 1.2 Explanation
- Our project Endangered Fauna World Window includes Dynamic Earth and Game Home two systems and they are deployed in two containers with port 3000 and port 80.
- Dynamic Earth: We find the public API Three.js and OrbitControls.js to design and build 3d earth. and integrate our fauna data from wiki into the earth. The technology stack here includes basic language HTML,CSS and Javascript. This system is a pure front-end system that could be started up locally without server. If you are interested, you could refer to the last part of this file and start it up locally.
- Game Home: the entance of the whole project and there is link for players to get access to the dynamic earth
   
   1) Front End: basic front-end languages and frames. We use the bootstrap frame to design and build the layout of game home page and game pages. There are useful and mature elements. For the data acquisition and web page jump, we apply the thymleaf frame, which is recommended by SpringBoot to build web project.
   2) Back End: Based on Java, the main technology stack is SpringBoot. With SpringBoot and maven tool, we could import dependencies and manage them in short time. Based on the annotation development, SpringBoot is easy to start up a simple web project quickly and it is convenient to connect to database in order to do the crud operations.
   3) Database: We use MySQL 5.7 as our database server and implement the crud operation by making use of MybatisPlus in back end.

# 2. Database

## 1.1 Mind Diagram   
<img src="Documentation/pics/db_mind.jpeg" width="800" height="450"/></br>

## 1.2 Data Model- Fauna class
- version 1:
| Java | MySQL |
| :--: | :--:  | 
| private int id | id INT PRIMARY KEY AUTO_INCREMENT |
