# PaperMoneyStore

This is a webapp selling antiques, banknotes, coins of Vietnam and the world, the frontend is developed by Bootstrap 5, AngularJS, JSP, the backend is developed by Spring Boot and Azure SQL Database. Users can use functions such as login, registration, forgot password, change password as well as add items to the cart, user password is encrypted then save to the database. Admin can add, delete, edit, view list of products, accounts, categories, orders and view sales. Only the admin account can access the admin page.

# Stack used
  *	Stack:
    -	Frontend: AngularJS, JSP, Bootstrap 5, JQuery
    -	Backend: Spring Boot, Spring Data JPA
    -	Database: Azure SQL Database, SQL Server 2019
  *	Software:
    -	Spring Tool Suite 4.14
    -	Visual Studio Code + Spring Boot extension
    -	Intellij IDEA Ultimate
    -	JDK 11

# Guide
  - Clone this repo, run the sql script to create database, then change database credentials in application.properties according to your database info
  ```
    # for SQLServer Database connection
    spring.datasource.url=jdbc:sqlserver://localhost:1433;database=<your database>
    spring.datasource.username=<your username>
    spring.datasource.password=<your password>
    spring.datasource.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
    spring.jpa.hibernate.dialect=org.hibernate.dialect.SQLServer2012Dialect
    spring.jpa.show-sql=false
    spring.jpa.hibernate.ddl-auto = none
  ```
  - Create a app password for your gmail in order to send email in this webapp
  ```
    # for send mail contact
    spring.mail.host=smtp.gmail.com
    spring.mail.port=587
    spring.mail.username=<your gmail username>
    spring.mail.password=<your gmail app password>
    spring.mail.properties.mail.smpt.auth=true
    spring.mail.properties.mail.smtp.starttls.enable=true
  ```
  - This project require JRE/JDK11 to run


# Database diagram
  ![image](https://user-images.githubusercontent.com/52403567/174494905-798f699f-5d3f-45fe-bc37-dc4b1a1816c1.png)
  
# Demo
![image](https://user-images.githubusercontent.com/52403567/174494982-f6d4221c-8b36-4904-8456-62f424210496.png)

![image](https://user-images.githubusercontent.com/52403567/174495022-ee870b11-633e-47b6-8849-620acfe7588a.png)

![image](https://user-images.githubusercontent.com/52403567/174495057-b76bb23d-babb-47ce-bc49-850882f13e35.png)

![image](https://user-images.githubusercontent.com/52403567/174495093-4e4786fa-01b2-44f4-9db2-32ea645e86b1.png)

