# docker
innova-demo docker

# build
docker build -t innova-demo .

# build with last source code
docker build --no-cache -t innova-demo .

# run
docker run -d -p 8080:8080 innova-demo

# application
http://localhost:8080/frontend/

# h2 console
http://localhost:8080/backend/console
>Setting Name: Generic H2 (Embedded)<br />
>Driver Class: org.h2.Driver<br />
>JDBC URL: jdbc:h2:mem:innova_db<br />
>User Name: username<br />
>Password: secret<br />

# swagger-ui
http://localhost:8080/backend/swagger-ui.html
