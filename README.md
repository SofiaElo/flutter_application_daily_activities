Your Daily Life
===============

Practicalities
--------------
- This project is for learning Flutter and Dart.
- Lib folder contains the code for frontend graphics and functionalities.
- Pictures of the current state of the Application can be viewed in the folder PicsOfApp.


About the application
---------------------

This is an application to track you daily activities and the times they have taken. User can insert the amount of sleep, studying, sports and other activities as time spent with the accuracy of an 0.5 hour. Tracking drinks can be done in dl. On the frontpage the user can also select their mood. There are home, goal, form, mood and results pages. The navigation is located in the upper left corner wiht icons and all pages except the mood page have their own icons, the mood page is only accessed by the buttons on front page.

The application has a frontpage with title and info of the application. There is a button to form page where one can input data for the application and its statistics. There is similar button for moving to goal page to set goals. Additionally in the home page there is two buttons for moods and by pushing button user is moved to a new page containing only text.

The form page has two forms which move based on screen width. There user can input activities and drinks to the application. All items' duration/amount can be modified and they can be removed on that page. 

The goal page contains form for adding goals and shows the goals as list with option to remove them. 

The statistics and goals are shown on results page. The statistics show donut charts for activities and drinks which are located on the page based on screen width. The goals are listed after hte charts and they have icons indicating if htey are reached. 

The mood page contains only small text based on the users mood (sad or happy). 

[Link to the application when deployed online] 
-----------------------

Contents of src/lib folder
--------------------------
- The main.dart contains the application.
- The pages folder contains the different screens which use the components from widgets folder. 
- The widgets folder contains different components and they are divided to form_screen and results_screen folders. 
- The models contain the objects used in the application.
- The controllers folder contains the controllers handling the logic of the application.

    