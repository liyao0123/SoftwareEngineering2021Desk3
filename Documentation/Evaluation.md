## Evaluation
#### 1. Designs and Techniques

 - **Database:**    
   We use MySQL to store the data we need. Many of the world's largest and fastest-growing organizations including Facebook, Google, Adobe, Alcatel Lucent and Zappos rely on MySQL to save time and money powering their high-volume Web sites, business-critical systems and packaged software[1].
   Therefore, with this powerful tool, data storage and query are reliable and fast. It seems that the data of our project is unworthy of MySQL's talent. However, it would be a good prototype for a large project. As for the query work, we use MyBatisPlus to do the query. The encapsulated methods in it help developers save writing SQL statements. 
   In our situation of short-time development of web pages, this help is exactly what we need.
   <br/>   
   Everything has two sides. The limitation of using MySQL is that it seems more complicated compared with NoSQL technology especially in a small project. 
   We need to configuration connection information and manage dependencies. After that, we need to build the database, create tables, insert values and declare keys too.
   It's lucky that MyBatisPlus could simplify the query work. Without that tool, I could not imagine how many tedious things we must do.<br/>
   <br/>
 - **Back End:**    
   We use SpringBoot to do the back-end work. It has features including: 
    1) Create stand-alone Spring applications
    2) Embed Tomcat, Jetty or Undertow directly (no need to deploy WAR files)
    3) Provide opinionated 'starter' dependencies to simplify your build configuration
    4) Automatically configure Spring and 3rd party libraries whenever possible
    5) Provide production-ready features such as metrics, health checks, and externalized configuration
    6) Absolutely no code generation and no requirement for XML configuration[2]   
       
   Above all, SpringBoot could help us start a web project quickly and doesn't require many configuration files. By the way, the embedded server tomcat is so convenient that our web project could run and test on a server directly.
   With that, we could test the request and response in advance.
   Besides, introducing the dependency devtools could achieve hot deployment. That means, when we do some changes on html file, then press `CTRL+F9` and refresh the page, the new contents would show up. It is very time-saving.
   In addition, another useful developing tool lombok would eliminate the declaration of methods and constructors in class. With `@Data` annotation, everything is done.<br/>      
   It is obvious that disadvantages and advantages correspond to each other. Even though, developers could start a web application with SpringBoot quickly, they must need to study more to do deep customization. To understand how the SpringBoot works, understanding the knowledge of JavaWeb, Spring, SpringMVC and MyBatis is necessary.
   This requires a certain accumulation of knowledge.  
   <br/>
 - **Front End:**    
   Based on HTML,CSS,JavaScript, we make use of Thymeleaf and Bootstrap. Thymeleaf is recommended by SpringBoot to work with when developing a web application. This modern server-side Java template engine could bring elegant natural templates to our development workflow.
   "It means that HTML can be correctly displayed in browsers and also work as static prototypes, allowing for stronger collaboration in development teams. With modules for Spring Framework, a host of integrations with your favourite tools, and the ability to plug in your own functionality, Thymeleaf is ideal for modern-day HTML5 JVM web development."[3]
   Since we have already developed with Spring frames, it is better to work with Thymeleaf together.   
   <br/>
   As for the Bootstrap, Bootstrap is a popular front-end framework that streamlines website design. It allows for the creation of easy and responsive web layouts[4].
   With so many useful and good-looking elements, developers could build a web page in short time. For our team, it is so friendly that we don't have to achieve the function by typing each code but just introduce one class we need. With bootstrap, we could have more time considering the function and logic.
   <br/>   
   Tools are tools after all. They are designed for general needs. When we want some special design, we still have to get back to the original syntax of JavaScript and do some customization. What's worse, applying Thymeleaf grammars to each HTML tags seems not that easy. In some situations, we have to give it up and get back to the HTML itself even if there is much more it can do. 
#### 2. Compare with MEAN
Actually, there are three reasons why we chose other stacks rather than MEAN. 

The first and the most main factor is that we had the fundation of Spring frames. At the beginning, our team planned to learn about the MEAN stack. Two members would study front-end knowledge and others would study the rest. As the time goes on, everyone tried the best to keep up the pace. However, the fact that we have no more time to learn new technology and apply it to our project before the deadline pushed us to make a change. Haojie Xin would be responsible for almost all development work because he has the fundation of Spring frames. Others keep learning and do some help when Haojie needs help. Thanks for the Easter vacation. During  the vacation, we did the final sprints and prepared the knowledge that we need. One of them is SpringBoot, which is embedded with the tomcat server and offers the web development starters. With this comprehensive frame, we don't have to learn the Express frame and Node.js respectively.

The second reason is that we want to deepen the understanding and application of MySQL. In the course of tools, we met the MariaDB for the first time and did some exercises about it. The contents are not enough for us to understand the database totally. Therefore, we decided to use MySQL in our project so that we could apply it in real project. After the whole process, it did encourage us to learn more about the MySQL. We have a command of the skill about how to design and build a database according to our own needs and users' needs. This useful experience would definitely benefits our future work. Compared with MongoDB, these two database have their own strengths and weaknesses. From the view of data we used in our project, these two are both suitable. However, as we said before, we have no more time to learn and get familiar with a new technology especially there is only one student who could do the development job. To use what we have learned seems to be a sensible choice. If we have spare time after the deadline, it would be a good chance to pick up the knowledge of MongoDB.

Last but not least, the main languages of the front-end API we use are HTML,CSS and JavaScript. We just need to do some customization according to users' needs with the above languages. If we try to apply the Angular, we need to study the frame first and then integrate it with the API. Changing the original code with differnt language is not good try. There may be many problems and bugs we need to fix. Therefore, there is no need using the Angular in our project. However, it is undoubtedly a tool we will try in the future. With the frame, the developing work would be easier and happier.






#### 3. Timeline of evaluation of designs
<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/a52d653086a0bb537fa38148ce3465473a152650/Documentation/pics/timeline.png" ><br/>   
**if it is not clear, click the photo directly or see the HTML file directly** [Timeline of evaluation](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/df6be836a6418bdaf05ebaf5db8318406b8ac8e8/Documentation/html/timeline.html)

## Unit testing
#### 1. Database
 - use jdbcTemplate to test the connection with local MySQL server. It works and approves that the configuration information is all good.
   ````
   @Test
    public void testConnection(){
        //select data from the test demo table user
        List<Map<String, Object>> maps = jdbcTemplate.queryForList("select * from user;");
        System.out.println(maps.toString());
        //works
    }
   ````
 - after building the FaunaService interface, FaunaMapper interface and FaunaServiceImpl, test the query function with MyBatisPlus. 
   ````
   @Test
    public void testFaunaMapper(){
        //get random data where kind is null
        QueryWrapper<Fauna> query = Wrappers.query();
        query.isNull("game_id");
        List<Fauna> list = faunaService.list(query);
        log.info(list.toString());
    }
   ````
   
#### 2. Back End
 - just run the following main function. It is the start of the whole SpringBoot project. If there is something wrong, the request `http://localhost:8080` on a browser would not show anything. Check the logs in Idea terminal and locate the errors.
   ````
   @MapperScan("team.desk3.efww.mapper")
   @SpringBootApplication
   public class EndangeredFaunaWorldWindowApplication {
      public static void main(String[] args) {
         SpringApplication.run(EndangeredFaunaWorldWindowApplication.class, args);
      }
   }
   ````
#### 3. Front End
 - with the devtools and its hot deployment function, we could test any change of HTML by clicking `CTRL+F9` and refreshing page.
 - to test some Javascript function, the `alert()` would help show the variable and see if it is right.

## User testing

#### 1. Method - questionnaires
 - Did you encounter bugs while browsing our game home page or dynamic earth?
 - Do you have any suggestions about the layout of our website?
 - Are you satisfied with the theme and content?
 - Do you enjoy interactions way of our web application?
 - What improvements would you like to see on our web?

The above are some question when we do user testing. More details could be seen here. [Questionnaires file](https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/5f4c293bfebcdbe7b532e149d697afad6767ab16/Documentation/docs/ques.md)

#### 2. History, Findings and implications
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


### Quotation
 > [1] Why MySQL? https://www.mysql.com/why-mysql/   
 > [2] Features of SpringBoot. https://spring.io/projects/spring-boot   
 > [3] Thymeleaf introduction. https://www.thymeleaf.org/index.html   
 > [4] Bootstrap introduction. https://github.com/topics/bootstrap   
