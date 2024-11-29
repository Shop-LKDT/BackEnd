# Project Documentation

## Requirements
- **JDK Version**: 21  
- **Database**: MySQL  

---

## How to Run the Project

### Step 1: Configure `.env` File  
Create a `.env` file in the root directory of the project and add the following variables:  
GOOGLE_CLIENT_ID = [Your Google Client ID] 
GOOGLE_CLIENT_SECRET = [Your Google Client Secret] 
GOOGLE_REDIRECT_URI = [Your Google Redirect URI]



### Step 2: Import Database  
Import the `lkdt.sql` file located in the source code into your MySQL database.

### Step 3: Update `application.yml`  
Modify the `application.yml` file to configure the database connection as follows:  
```yaml
spring:
  datasource:
    url: jdbc:mysql://${MYSQL_HOST:localhost}:3306/lkdt
    username: root
    password: [Your Database Password]
    driver-class-name: com.mysql.cj.jdbc.Driver
