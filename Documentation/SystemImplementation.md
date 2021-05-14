# 1. Stack architecture

## 1.1 Mind Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/211ff1b1c3659f7191683c75d294fba57a53f9bc/Documentation/pics/efww_mind.jpeg"/></br>


## 1.2 Explanation
- Our project Endangered Fauna World Window includes Dynamic Earth and Game Home two systems. They are deployed in two containers with port 3000 and port 80 respectively.
- Dynamic Earth: We find the public API Three.js and OrbitControls.js to design and build 3d earth and integrate our fauna data from wiki into the earth. The technology stack here includes basic language HTML, CSS and Javascript. This system is a pure front-end system that could be started up locally without a server. If a person is interested, he could start it up locally.
- Game Home: the entrance of the whole project, and there is a link for players to get access to the dynamic earth

    1) Front End: primary front-end languages and frames. We use the bootstrap frame to design and build the layout of the game home page and game pages. There are valuable and mature elements. For the data acquisition and web page jump, we apply the Thymeleaf frame, which SpringBoot recommends to build a web project.
    2) Back End: Based on Java, the primary technology stack is SpringBoot. With SpringBoot and maven tool, we could import dependencies and manage them in a short time. Moreover, based on the annotation development, SpringBoot is easy to start up a simple web project quickly, and it is convenient to connect to a database to do the crud operations.
    3) Database: We use MySQL 5.7 as our database server and implement the crud operation by using MybatisPlus in the back end.

# 2. Database

## 2.1 Mind Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/fab8073a2f262e372a5dd336485399b65d8f922f/Documentation/pics/db_mind.png"/></br>

**If it is nor clear, you could see the html file directly. [Data Model Diagram](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/main/Documentation/html/db_mind.html)**

## 2.2 Data Model- Fauna class
To meet the need of playing a game with fauna data, the attributes below are what we pick out. Specifically, the falseArea is used as a distraction choice in game1.

- **version 1:**
  
  | Java  | MySQL |   
  | :--- | :--- |   
  | private int id | id INT PRIMARY KEY AUTO_INCREMENT |   
  | private String name | name VARCHAR(50) NOT NULL |  
  | private String area | area VARCHAR(20) NOT NULL |  
  | private String falseArea | false_area VARCHAR(20) NOT NULL |  
  | private String threat | threat VARCHAR(255) DEFAULT NULL |  
  | private String description | description TEXT DEFAULT NULL |  
  | private String link | link VARCHAR(100) NOT NULL, |  
  | private String picture | picture VARCHAR(50) DEFAULT '/images/Asian_elephant.jpg' |   

- **version 2:**
   
   - add kind - divide the game1 data and game2 data


  | Java | MySQL |
  | :--- |:---| 
  | private String kind | kind VARCHAR(20) DEFAULT NULL |

- **version 3:**

    1. remove the threat description - because the contents are too long on the page and redundant. We plan to put it into the dynamic earth but not game home
    2. change kind to gameId - more clear
    3. add falseName - used as a false choice in game2
    4. add hint - used as tips for players to make the right choice
  
- **final version:**

  | Java  | MySQL |   
  | :--- | :--- |   
  | private int id | id INT PRIMARY KEY AUTO_INCREMENT |   
  | private String name | name VARCHAR(50) NOT NULL |  
  | private String falseName | false_name VARCHAR(50) NOT NULL | 
  | private String area | area VARCHAR(20) NOT NULL |  
  | private String falseArea | false_area VARCHAR(20) NOT NULL | 
  | private String link | link VARCHAR(100) NOT NULL |  
  | private String picture | picture VARCHAR(50) DEFAULT '/images/Asian_elephant.jpg'|  
  | private String gameId | game_id varchar(30) default '1-1' |   
  | private String hint | hint VARCHAR(50) DEFAULT NULL |   

## 2.3 Implementation 
#### 2.3.1 Build the database-faunaworld: the sql files are as follows db_v2.sql db_v3.sql
- [database_version2](https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/3e256636c419f41c204cf1714ed8aab4093a2fb5/static/database/db_v2.sql)
- [database_version3](https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/3e256636c419f41c204cf1714ed8aab4093a2fb5/static/database/db_v3.sql)
#### 2.3.2 Manage dependencies in pom.xml
- configure all the dependencies we need to operate the database
- note: the version should correspond to local MySQL server version, the 5.1.49 could be used for Mysql 5.x version
  ````
    //database driver  
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <scope>runtime</scope>
        <version>5.1.49</version>
    </dependency>
    //data source starter
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>druid-spring-boot-starter</artifactId>
        <version>1.1.17</version>
    </dependency>
    //MybatisPlus starter
     <dependency>
         <groupId>com.baomidou</groupId>
         <artifactId>mybatis-plus-boot-starter</artifactId>
         <version>3.4.1</version>
    </dependency>
  ````
#### 2.3.3 Communicate with back end   

- Data source: Use Druid as a data source and to offer the connections for queries. Druid is one of the best database connection pools written in JAVA. In addition, Druid provides powerful monitoring functionalities and more. Here, we start the function of monitoring and wall. They are set in the application.xml file. By doing so, we could log in to the Druid administration platform to see the query data.
- Database Information: Use Spring to manage the connection information. The data username, password, URL and driver class name are set in the application.yml file. They are the necessary information to connect to MySQL server.

  ````
    spring:
      datasource:
        username: root
        password: your password
        driver-class-name: com.mysql.jdbc.Driver
        url: jdbc:mysql://localhost:3306/faunaworld
  ````

- Query: Use MybatisPlus to finish the crud operations. Basically, there are three crucial class and interface we need to build. The FaunaMapper interface extends the BaseMapper<T> so that we could use insert, select, update and delete methods. The FaunaService interface would extend the IService<T> to do the crud operations. The BaseMapper and IService both encapsulate the operation of the Dao layer, but the latter one is more powerful. After building the service interface, we need the last fulfil class FaunaServiceImpl to extend the senior class ServiceImpl<FaunaMapper, Fauna> in MybatisPlus and implement the former interface FaunaService. For now, if we inject the FaunaService into Spring container, we could call the functions to fulfil a query with the database we set before. 
  ````
    //the main codes are here
    @Mapper
    public interface FaunaMapper extends BaseMapper<Fauna> {}
    public interface FaunaService extends IService<Fauna> {}
    @Service
    public class FaunaServiceImpl extends ServiceImpl<FaunaMapper, Fauna> implements FaunaService {}
    //in controller class, inject FaunaService
    @Autowired
    FaunaService faunaService;
  ````

# 3.Back End
## 3.1 Back End Diagram
<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/211ff1b1c3659f7191683c75d294fba57a53f9bc/Documentation/pics/be_mind.jpeg"/><br/>

## 3.2 Manager dependency
- configure all web development starters
  ````
    //the core configuration with SpringBoot, there are almost all configuration information for development
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.4.5</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    //web development starter dependency in SpringBoot
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
  ````
## 3.3 Bean - Fauna class
- We have built the bean class before. Remember, names of attributes should correspond to the data model in MySQL. In Java, we should name it in camel case like falseName. In MySQL, we should name the column with one _ between two words like false_name.

## 3.4 Controller
- SpringBoot has been embedded with the tomcat server with port 8080.
- Function: deal with the user request and response with data.
- Explanation: the contents and themes of the game home page, game1 page, game2 page are totally different. Even though there are three kinds of pages, `index.html`, `game1.html` and `game2.html`, they are all within the definition of SPA. Especially, there are four games with different data rendered in game1.html, and so does game2.html. For the same kind, the page would not forward to another URL but with different request parameters.

#### 3.4.1 IndexController
- request: `http://localhost:8080/`
- explanation: when players get access to our game home page via URL, SpringBoot will help deal with the users' requests and respond with data or forward/redirect to a new page. 
  If a player tries to get access to `http://localhost:8080/`, the IndexController would deal with the `/` request and take you to the `index.html` page as codes shown below. The `index.html` file is in the `src/main/resources/templates/`. 
  Then leave the rest work to SpringBoot. Therefore, we need to specify the path under classpath and file name. Then leave the rest work to SpringBoot.
  ````
    @Controller
    public class IndexController {
        //request mapping start with /
        @GetMapping(value = {"/index","/"})
        public String toIndex(Model model){
            return "index";
        }
    }
  ````
#### 3.4.2 GameController
- request:`http://localhost:8080/game1` `http://localhost:8080/game2`
- explanation: Because there are two game strategies, there would be two kins of the game page with different render logic. 
- processing flow: 
      
  1. When players request the game page, we would get the request parameter `gameId` first. 
  2. Then use the faunaservice injected before to call `list()` function. The selection condition is `where game_id = gameId`. In MybatisPlus, developers could filter data with Wrappers class. 
  3. After we get the data from the database, we put it into the model domain so that we could get the data on the front page.
  4. Besides, to classify different game links, we deal with the same and different request parameters here and then put them into the model. Finally, because we need to make judgements after each click, the card number/fauna data number is helpful to this.
  ````
    @Controller
    public class GameController {
        @Autowired
        FaunaService faunaService;

        @RequestMapping("/game1")
        public String toGame11(@RequestParam("gameId")String gameId, Model model){
            //select data from db where the category is 1-1
            QueryWrapper<Fauna> queryGame1 = Wrappers.query();
            queryGame1.eq("game_id",gameId);
            List<Fauna> faunaList = faunaService.list(queryGame1);
            model.addAttribute("faunaList",faunaList);
            //add the query number to the model
            model.addAttribute("cardNum",faunaList.size());
            //put the category into model
            model.addAttribute("sameParam",gameId);
            //put the another request param into model
            String diffParam = gameId.equals("1-1") ? "1-2" : "1-1";
            model.addAttribute("diffParam",diffParam);
            return "game/game1";
        }
    }
   ````

## 3.5 Other dependencies
- spring-boot-starter-thymeleaf: for front-end development with the server. 
- spring-boot-configuration-processor : could offer some hints when writing configuration file application.yml
- lombok: simplify the work of building bean class with annotation @Data
- spring-boot-devtools: used for hot deployment by clicking `ctrl+F9`
- spring-boot-starter-test: used for testing

# 4. Front End
## 4.1 Front End Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/fc4fea9d363ab7f01659263a81544cb3e73361fb/Documentation/pics/fe_mind.png" /><br/>


**If it is nor clear, you could see the html file directly. [Front End Diagram](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/main/Documentation/html/fe_mind.html)**

## 4.2 Dynamic Earth
**find a template of dynamic earth and integrate our date into different spot**

#### 4.2.1 layout
- center: dynamic earth with many spots
- right window: there are name, distribution, description, threats, link and image information of fauna.

#### 4.2.2 static data
- format our fauna data into data.js. The specific position according to earth map in data.js could help locate the spot.

#### 4.2.3 interaction
- click the spot on earth, and the right window would display with information. The action is controlled by `onClick()` function.
  When a spot is clicked, selector would get the data and then render it into right window.
- rotate the earth and would find fauna

## 4.3 Game Home

**find a template of bootstrap responsive web and do deep customization with our date**

#### 4.3.1 index.html
- layout: the above is the layout of our index.html. We use the mature elements of Bootstrap.
     1. Use containers especially grid class to control the layout and fulfil responsive window
     2. Bootstrap includes several predefined button styles. Moreover, they are what we make use of often here.
- static data: there are many photos in the carousel part and game parts. Using `@{path}` in Thymeleaf would help us get the resources under classpath like *.css,*.js and images.
The prerequisite of developing with Thymeleaf is introducing its namespace at the beginning.
  `<html lang="en" xmlns:th="http://www.thymeleaf.org">` and add `th:` before each attribute of tags like:
  
  ````
  <link rel="stylesheet" href="../static/css/bootstrap.min.css" th:href="@{/css/bootstrap.min.css}">
  <img th:src="@{/images/carousel_blue_whale.jpg}" class="d-block w-100 h-100" alt="...">
  ````
- interaction: look through the page and do filter some fauna in the game review part
#### 4.3.2 game.html

- layout: The customization here is almost on the fauna card. We add two choices button and hint for players to choose from and the "more games" button group at the right corner.
  
- dynamic data: The data rendered here of each game is from the MySQL database. The query work is done at the back end before getting access to this page. Different game would send the request with different request parameter like `<a th:href="@{/game2(gameId='2-1')}">Game2-1</a>`.
  With `${}` in Thymeleaf, we could get the data from the model domain. With `th:each=""`, we could traverse the data stored in a list and render each one on the card. 
  
- interactions: 
   1. click the choice button and show the right/wrong warning. We use the attribute `stat` of `th:each` to put the traversal number on each card so that the selector would find it in jQuery.
      The warning message is empty at the beginning. When the player clicks the button, the function `right_btn_click(btn_msg)` would split the btn_msg by `,`. Then it would trigger the `disabled` attribute of two buttons.
      The `btn-danger` class would be added to the wrong button, and the `active` class would be added to the right button. Then, finally, the warning message would be added according to which button's onclick event was triggered.        
  
  ````
  <button th:id="right_btn+${stat.count}" class="btn btn-outline-success" th:text="${fauna.area}"
                                th:onclick="right_btn_click([['#right_btn'+${stat.count}+','+'#msg'+${stat.count}+','+'#wrong_btn'+${stat.count}]])"></button>
  ````
   2. correct rate window would pop up when all the cards have been chosen. This would be triggered when the number of disabled class equals to the double number of cards.
  Then, count the number of active class and divide by card number. The window is a modal element of Bootstrap. It would be triggered by doing `$('#result').modal('show')`
   3. hint would show when players click it. The main content of onclick funciton is `$(p_id).attr('style','display:block')`
  
- logic: the game1 is to choose right answer between area/falseArea and game2 is name/falseName

# 5. Deployment

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
More details about the deployment procedures can be found in [DeploymentDetail.md](/application/DeploymentDetail.md)

### Quotation
- SpringBoot documentation
  > https://docs.spring.io/spring-boot/docs/current/reference/html/
- MyBatisPlus documentation
  > https://baomidou.com/guide/ 
- Druid documentation
  > https://github.com/alibaba/druid/wiki/FAQ
- Thymeleaf documentation
  > https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html
- Bootstrap documentation
  > https://getbootstrap.com/docs/5.0/getting-started/introduction/
- Smart - Multipurpose Landing Page Template by UIdeck
  > https://uideck.com/templates/smart
- Zepto.js 3D picture carousel rotation plug-in by uyuyu41232
  > http://www.bootstrapmb.com/item/9212
- 3D earth API by mrdoob
  > https://github.com/dataarts/webgl-globe
