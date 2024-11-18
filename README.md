JDK VERSION 21
Cách chạy Project:
- Tạo file .env, sau đó thêm:
GOOGLE_CLIENT_ID = 
GOOGLE_CLIENT_SECRET = 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
GOOGLE_REDIRECT_URI = http://localhost:4200/auth/google/callback
- import file lkdt.sql (strong source code có é)
- trong file application.yml, phần database đổi lại:
  datasource:
    url: jdbc:mysql://${MYSQL_HOST:localhost}:3306/lkdt
    username: root
    password: (khúc này đổi lại pw của databsae)
    driver-class-name: com.mysql.cj.jdbc.Driver
