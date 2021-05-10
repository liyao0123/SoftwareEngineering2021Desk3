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

#### 2. Timeline of evaluation of designs
<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/a52d653086a0bb537fa38148ce3465473a152650/Documentation/pics/timeline.png" ><br/>   
**if it is not clear, see the HTML file directly** [Timeline of evaluation](http://htmlpreview.github.io/?https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/df6be836a6418bdaf05ebaf5db8318406b8ac8e8/Documentation/html/timeline.html)

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

#### 2. Findings and implications
 - User Yanliang: the warning words of game are not friendly. We make it more friendly according to this feedback. The first version is wrong and right. The latter version would show bingo, or it should be xxx.
 - User Yuwei: the carousel layout seems a little deformed. In fact, besides Yuwei, all members in our team complain the carousel all the time. We repeat the pictures in x-axis in version1. Then we cover it in the whole background with two fauna in one picture. Finally, we decide to find some beautiful and HD images to put. It looks better.
 - User Jiaqi: it is better if the dynamic earth rotates itself. We add this interaction way in our dynamic earth version2.
 - More users' feedbacks have been added to the timeline of evaluation and our usual meeting logs. There is no need to repeat it here again.

### Quotation
 > [1] Why MySQL? https://www.mysql.com/why-mysql/   
 > [2] Features of SpringBoot. https://spring.io/projects/spring-boot   
 > [3] Thymeleaf introduction. https://www.thymeleaf.org/index.html   
 > [4] Bootstrap introduction. https://github.com/topics/bootstrap   
