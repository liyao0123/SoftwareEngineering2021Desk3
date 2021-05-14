

# UX design

For UX design, we followed the UX process provided by [UX mastery](https://uxmastery.com/resources/process), which includes research, analysis, design and production. This part will focus on the first three phases since the production phase will be covered in the system implementation part. We use several techniques to accomplish UX process better. For example, we use questionnaires and interviews in the research phase, and we analyze interacting users and stakeholders. Then, we considered the user stories that we would like to bring about. Finally, in the design phase, we utilized mood boards, wireframes, interaction flow diagram and generate a clickable prototype at last.  

![UX](pics/UX.png)

## Research

### Questionnaires

 [<img src="pics/icon-Q.png" width = "50" height = "50" alt="question" />](https://ov7517xx4ey.typeform.com/to/haDsNnq5)
 
We did a quick survey after confirming our topic, namely protecting wild endangered fauna. The survey includes questions about whether users have experienced similar website, what presenting method survey respondents prefer and what kinds of playful game they prefer. In the end, we ask respondents who are willing to participate in our future interviews for emails so that we can get in touch with them later. The survey is still open, and you can click the icon above to view questions.  

[![Questionnaires](pics/Questionnaire.jpg)](https://ov7517xx4ey.typeform.com/to/haDsNnq5)  

<br/>

![Results](pics/Results.jpg)  

We collect 59 responses in total. As demonstrated in these charts above, most respondents (39 out of 59) have visited similar website, but they would like to have a better experience. More than 2/3 of respondents think that 3D earth is the best way to present endangered animals. In addition, the average rate of the respondents’ willingness to have a website that can show endangered animals vividly is around 4, which means that the demand for our project is substantial. Moreover, more than half of respondents regard the Q&A approach as effective for consolidating the impression for endangered animals. To sum up, the result is within our expectation, and we need to ask some detailed questions for the respondents who complete the last question in which they provide the contact methods.

### Interviews

We talked with two potential users via text chat about the idea of our project and opinions about the design of our website. The finding of two interviews is demonstrated below:

**About the topic:**

**Q1: Are you interested in protecting endangered animals?**  
Interviewee 1 says, “Sure, I would like to make a contribution to protecting endangered animals if possible.”
Interviewee 2 says, “Not very because I believe protecting individuals of endangered animals makes no sense biologically especially for some uncommon animals for humans.”  


**Q2: Can you recognize the following animals as Endangered or Least Concern animals?**  

![Hippopotamus](pics/Hippopotamus.jpg)
![Haliaeetus_leucocephalus](pics/Haliaeetus_leucocephalus.jpg)
![Golden_hamster](pics/Golden_hamster.jpg)  

The correct answer is that the middle one, called Haliaeetus leucocephalus, is the Least Concern animals, while the others are Endangered animals called Hippopotamus and Golden hamster.
Both interviewees cannot classify those animals perfectly, and they are also surprised by the result. Interviewee 1 says, “Hippopotamus should be common animals in the zoo, how come it belongs to endangered animals.”

**Q3: What is your attitude to activities about animal protection?**  
Interviewee 1 believes that those activities are essential, and he says, “endangered animal is vital for the biodiversity, which tends to benefit not only human but also the earth”. However, interviewee 2 hold a different opinion, and he says that it is inevitable that some species will distinct because only the fittest can survive. Therefore, human beings should not interfere with the natural process.


**About the earth page:**

**Q1: For presenting those endangered animals, how do you think the method we use, namely a 3D globe containing luminous points that represent animals?**  

Both interviewees like the way we present animals, namely using a 3D dynamic globe, and they believe that the method is more intuitive than others, such as a list or pure pictures.

**Q2: Do you have any suggestions about the globe?**  
Interviewee 1 says that when users enter the earth page, the globe should rotate gently, which makes the page more vivid, and it will elicit users to drag the globe.
Interviewee 2 also suggests that when users click the luminous point, the earth should zoom in to the area while the details should be a list at the right.


**About the game page:**

**Q1: Do you have any suggestions about the design of the game page, namely answering questions?**  
Firstly, the layout of those cards, one agrees that a new card should appear after completing the last question. However, the other interviewee thinks it is more intuitional if the cards are shown on one page, and users can click other cards to change questions. Then, we discuss whether the question card should switch to the next one automatically after users complete the question. Both of them agree that it should not change directly, and they say, “users are likely to have a further look at the question regardless of the correctness of the answer”.

**Q2: Do you think that Q&A is an effective way to consolidate users’ memory about these animals?**  
Interviewee 1 argues that it ought to be effective, but some users are likely not to be interested in answering questions. Consequently, it is significant to make those question enjoyable.
Interviewee 2 says, “I think Q&A is boring, and most users probably will not play the game. If they want the information of endangered animals, they will explore the globe page instead of answering those questions.”  



## Analysis

### Interacting users

Combining the result and our thoughts, we considered the following user groups as the interacting users of our website.

- People who spend a lot of time in the wild such as hunters, geologist, archaeologist and so on
- People who are interested in protecting endangered fauna
- People who require a playful way to present endangered fauna, such as biology teachers

### Persona  
<br/>

We create two personas based on our research, and we are going to utilize the personas for further analysis and test.
![Eric](pics/Persona-Eric.png)
![Alice](pics/Persona-Alice.png)

### Stakeholder analysis

There are large numbers of stakeholders involved in this new website about protecting endangered animals. We will lay more emphasis on several primary stakeholders, including users, endangered animals, some NGOs and our data suppliers.

We analyze stakeholders in two aspects, namely interest and power. To begin with users, they have both strong interest and power related to our project since they can not only access our website to get information but also come up with opinions about the website. In addition, they have little power but high interest in the website for endangered animals because they tend to benefit from this project. As for NGOs such as World Animal Protection and WildAid, we would not regard them as our competitors, but we do provide a different way to present endangered animals. Consequently, our creativity is likely to influence and benefit each other. Therefore, we believe that NGOs have high power and interest in the project. Finally, we choose Wikipedia as our data source, and since it is open-source, it will not gain from our project, but they have strong power since our data are in charge of Wikipedia. 

We produced a power/interest matrix to demonstrate these stakeholders more straightforwardly, which is shown below. 

![Stakeholder](pics/Stakeholder.png)

### User stories

- A user can see a dynamic 3D earth that is draggable on the website.
- There are some luminous points on the earth, and by using a cursor to hover in a point, a user can preview the name and appearance of the endangered animal.
- A user can click the luminous points to access more detailed information about animals, including distribution, description, threats and the link to Wikipedia.
A user can play a mini-game to test whether he understands the distribution of endangered animals and consolidates the memory. The user should choose the right distribution area of an animal. Finally, a score and accuracy rate will be given according to the user’s choice.
- A user can play a mini-game to test whether he can distinguish the name among wild animals with a similar appearance. Finally, a score and accuracy rate will be given according to the user’s choice.

## Design

### Mood boards

![Mood](pics/MoodBoard.jpg)  
While creating our Moodboard, we first want to express the mood that we are grey about these animals facing with distinction. We also include some photos about hunting, which is our initial motivation that is preventing endangered animals from hunting no matter intentionally or accidentally. Moreover, we add some pictures that can inspire us about the key elements in our website design, such as the earth and some animal cards. For example, we present a globe on our home page, and we also use cards containing questions on our game page.

### Paper prototyping

<img src="https://github.com/liyao0123/SoftwareEngineering2021Desk3/blob/803ca990bf7542c6f8521e728eb907ab57593571/Documentation/pics/paper_prot_v1.gif" width="720" height="550">

The paper prototype is the first version we made at the beginning when professors introduced this element to us. We wanted to design a dynamic earth like "Mee Too" project last year. Users could rotate the earth and learn about the endangered fauna.

### Wireframes

#### Version 1  

The wireframe is the first prototype we design for the website, the first screen is our home page which includes a 2D map, and on the game page, we plan to use a 2D map to present endangered animals at the beginning.  
![Wareframesv1](pics/Wireframev1.png)


#### Version 2  

The photo below is our second version of wireframes. We improve the homepage layout and change the Q&A into cards from question lists in version 1. It includes a navigation bar and a body that is a wild animal picture. Another page is our game page which consists of the question cards and button to switch cards. For the earth page, we choose to use 3D goble instead of 2D map. The first one is the default page when users enter the website, and the second one is the layout of animal details when users click these yellow points.  

![Wireframes](pics/Wireframe.png)

### Interaction flow diagrams

While designing the wireframes, we consider the interaction flow of our users, and the design outcome is demonstrated below.  

![Interaction](pics/FlowChart.png)

### Final version prototype

We made six screens for the prototype. While completing the final prototype, we improve the design and some interactions. For example, we use a different colour for the button is a navigation bar to help the user distinguish the current page, and it is intuitional for them to click the other button. Moreover, on the game page, except for clicking the arrow on both sides, users can click the question card to switch the current question. In addition, we generated an interactive and clickable model for users to test via InVision, and you can access the model by clicking the link below.  

[Clickable prototype](https://xiaojun507579.invisionapp.com/console/share/PQ2J2NHWAU/617500159)
![Prototype](pics/Prototype.png)
