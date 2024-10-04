ASP.NET Web Forms Project - KAFUPM Web and Mobile App Course
Overview
This project is part of the King Fahd University of Petroleum & Minerals (KFUPM) Web and Mobile Applications Development course. It is built using ASP.NET Web Forms, demonstrating various functionalities including user login, admin controls, and comment management systems.

Technologies Used
ASP.NET Web Forms: The project is developed using the ASP.NET Web Forms framework, which is ideal for rapid web application development.
C#: The backend logic is written in C# to handle user authentication, role management (admin vs regular users), and database interactions.
SQL Server: The project connects to a SQL Server database to manage users, comments, and other relevant data.
HTML/CSS/JavaScript: Used to create the front-end user interface.
Features
User Authentication: Users can log in to the system with a username and password.

Admin credentials:
Username: Admin
Password: Admin
Admin Controls: If the logged-in user has admin rights, they are redirected to the admin dashboard, where they can view and manage visitor comments.

Comment System: Users can leave comments on the website. Admins have the ability to approve or remove comments.

Error Handling: The system handles wrong web pages with a custom error page (undermaintenance.aspx) that informs users that the website is under maintenance.

Role-Based Redirection: The system redirects users based on their roles (admin vs regular user).

Project Structure
/Admin: Contains pages related to admin functionalities like comment control.
/App_Data: Holds the database files (LoginDB.mdf, visitorDB.mdf) used in the project.
/JavaScript.js: Contains the JavaScript used for UI interactions like toggling between login and signup forms.
/StyleSheet1.css: The main CSS file used to style the web pages.
/Web.config: Configuration file for managing app settings, database connections, and custom error handling.
Database
The project uses a SQL Server database to store the following:

Users Table: Stores user information, including a boolean field IsAdmin to differentiate between admin and regular users.
Visitor Table: Stores visitor comments, emails, and statuses (approved or not).
Setup Instructions
Clone the Repository:

bash
Copy code
git clone https://github.com/wrwr0az/ASP.NET-LoginAssignment.git
Open in Visual Studio: Open the project in Visual Studio by navigating to the .sln file.

Database Setup: Make sure SQL Server is set up correctly. The database files are located in the /App_Data folder, and the connection strings are configured in the Web.config file.

Run the Project: Press F5 in Visual Studio to build and run the project locally.

Admin Credentials: Use the following credentials to log in as an admin:

Username: Admin
Password: Admin
