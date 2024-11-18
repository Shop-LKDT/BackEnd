JDK VERSION 21
Cách chạy Project:
- Tạo file .env
- import file lkdt.sql (strong source code có é)
- trong file application.yml, phần database đổi lại:
  datasource:
    url: jdbc:mysql://${MYSQL_HOST:localhost}:3306/lkdt
    username: root
    password: (khúc này đổi lại pw của databsae)
    driver-class-name: com.mysql.cj.jdbc.Driver
