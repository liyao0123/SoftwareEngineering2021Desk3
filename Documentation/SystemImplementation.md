# 1. Stack architecture

## 1.1 Mind Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/211ff1b1c3659f7191683c75d294fba57a53f9bc/Documentation/pics/efww_mind.jpeg"/></br>


## 1.2 Explanation
- Our project Endangered Fauna World Window includes Dynamic Earth and Game Home two systems and they are deployed in two containers with port 3000 and port 80.
- Dynamic Earth: We find the public API Three.js and OrbitControls.js to design and build 3d earth. and integrate our fauna data from wiki into the earth. The technology stack here includes basic language HTML,CSS and Javascript. This system is a pure front-end system that could be started up locally without server. If you are interested, you could refer to the last part of this file and start it up locally.
- Game Home: the entance of the whole project and there is link for players to get access to the dynamic earth

    1) Front End: basic front-end languages and frames. We use the bootstrap frame to design and build the layout of game home page and game pages. There are useful and mature elements. For the data acquisition and web page jump, we apply the thymeleaf frame, which is recommended by SpringBoot to build web project.
    2) Back End: Based on Java, the main technology stack is SpringBoot. With SpringBoot and maven tool, we could import dependencies and manage them in short time. Based on the annotation development, SpringBoot is easy to start up a simple web project quickly and it is convenient to connect to database in order to do the crud operations.
    3) Database: We use MySQL 5.7 as our database server and implement the crud operation by making use of MybatisPlus in back end.

# 2. Database

## 2.1 Mind Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/e0bf9569eebe453496b2ad14c271bfcb66a6bfe6/Documentation/pics/db_mind.jpeg"/></br>

**If it is nor clear, you could see the html file directly. [Data Model Diagram](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/main/Documentation/html/db_mind.html)**

## 2.2 Data Model- Fauna class
  To meet the need of playing game with fauna data, the attributes below are what we pick out. Specially, the falseArea
is used as distraction choice in game1.
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

    1. remove threat,description - because the contents are too long in page and redundant. We plan to put it into the dynamic earth but not game home
    2. change kind to gameId - more clear
    3. add falseName - used as false choice in game2
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

- Datasource: Use druid as data source and to offer the connections for queries. Druid is one of the best database connection pools written in JAVA. Druid provides powerful monitoring functionalities and more. Here, we start the function of monitoring and wall. They are set in the application.xml file. By doing so, we could log in the druid administration platform to see the query data. Its official repo in Github. [Druid](https://github.com/alibaba/druid/wiki/FAQ)
- Database Information: Use Spring to manager the connection information. The data username, password, url and driver class name are set in application.yml file. They are the necessary information you need to connect to MySQL server.

````
spring:
  datasource:
    username: root
    password: your password
    driver-class-name: com.mysql.jdbc.Driver
    url: jdbc:mysql://localhost:3306/faunaworld
````

- Query: Use MybatisPlus to finish the crud operations. Basically, there are three important class and interface we need to build. The FaunaMapper interface extends the BaseMapper<T> so that we could use insert,select,update and delete methods. The FaunaService interface would extend the IService<T> so that we could do the crud operations too. The BaseMapper and IService both encapsulate the operation of the dao layer, but the latter one is more powerful. After build the service interface, we need the last fulfill class FaunaServiceImpl to extend the senior class ServiceImpl<FaunaMapper, Fauna> in MybatisPlus and implement the former interface FaunaService. For now, if we inject the FaunaService into Spring container, we could call the functions to fulfill a query with database we set before. 
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
- We have build the bean class before. Remember names of attributes should correspond to the data model in MySQL. In Java, we should name it in camel case like falseName. In MySQL, we should name the column with one _ between two words like false_name.

## 3.4 Controller
- SpringBoot has been embedded with tomcat server with port 8080.
- Function: deal with the user request and response with data.
- Explanation: the contents and themes of game home page, game1 page, game2 page are totally different. Even though there are three kinds of pages `index.html`,`game1.html` and `game2.html`, they are all within the definition of SPA. Especially, there are four games with different data rendered in game1.html and so does game2.html. For the same kind, the page would not forward to other URL but with different request parameters.

#### 3.4.1 IndexController
- request: `http://localhost:8080/`
- explanation: when players get access to our game home page via URL, SpringBoot would help deal with the users' requests and response with data or forward/redirect to new page. 
  If you try to get access to `http://localhost:8080/`, the IndexController would deal with the `/` request and take you to the `index.html` page as codes showed below. The `index.html` file is in the `src/main/resources/templates/`. 
  Then leave the rest work to SpringBoot. Therefore, we just need to specify the path under classpath and file name. Then leave the rest work to SpringBoot.
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
- explanation: Because there are two game strategies, there would be two kins of game page with different render logic. 
- processing flow: 
      
  1. When players request to game page, we would get the request parameter `gameId` first. 
  2. Then use the faunaservice injected before to call `list()` function. The selection condition is `where game_id = gameId`. In MybatisPlus, you could filter data with Wrappers class. 
  3. After we get the data from the database, we put it into model domain so that we could get the data in front page.
  4. Besides, to classify different game links, we deal with the same and different request parameters here  and then put it into model too. Finally, because we need to make judgements after each clicking, the card number/fauna data number is helpful to this.

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
  Thymeleaf is a modern server-side Java template engine for both web and standalone environments, capable of processing HTML, XML, JavaScript, CSS and even plain text.Its official docs. [thymeleaf](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html)
- spring-boot-configuration-processor : could offer some hints when writing configuration file application.yml
- lombok: simplify the work of building bean class with annotation @Data
- spring-boot-devtools: used for hot deployment by clicking `ctrl+F9`
- spring-boot-starter-test: used for testing

# 4. Front End
## 4.1 Front End Diagram

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/211ff1b1c3659f7191683c75d294fba57a53f9bc/Documentation/pics/fe_mind.jpeg" /><br/>

**If it is nor clear, you could see the html file directly. [Front End Diagram](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/main/Documentation/html/fe_mind.html)**

## 4.2 Dynamic Earth
 **find template of dynamic earth and integrate our date into different spot.**

#### 4.2.1 layout
- center: dynamic earth with many spots
- right window: there are name, distribution, description, threats, link and image information of fauna.

#### 4.2.2 static data
- format our fauna data into data.js. The specific position according to earth map in data.js could help locate the spot.

#### 4.2.3 interaction
- click the spot on earth, and the right window would display with information. The action is controlled by onClick() function. 
  When a spot is clicked, selector would get the data and then render it into right window.
- rotate the earth and would find fauna

## 4.3 Game Home
#### 4.3.1 welcome page - index.html
 


#### 4.3.2 game1 page - game1.html



#### 4.3.2 game2 page - game2.html
