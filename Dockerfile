FROM alpine/git as git-clone
WORKDIR /app
RUN mkdir /app/backend && cd /app/backend
RUN git clone https://github.com/innova-demo/backend.git
RUN mkdir /app/frontend && cd /app/frontend
RUN git clone https://github.com/innova-demo/frontend.git

FROM maven:3.6.0-jdk-8-alpine as backend
WORKDIR /app
RUN mkdir /app/backend && mkdir /app/frontend
COPY --from=git-clone /app/backend /app/backend
RUN cd /app/backend/ && mvn clean test install && ls -la /app/backend

FROM node:9.8.0 as frontend
WORKDIR /app
RUN npm install -g @angular/cli@latest
COPY --from=git-clone /app/frontend /app/frontend
RUN cd /app/frontend/ && npm update && ng build --prod --base-href=/frontend/ && ls -la /app/frontend/dist

FROM tomcat:7-jre8-alpine as tomcat
WORKDIR /tmp
COPY --from=backend /app/backend/target/backend.war /usr/local/tomcat/webapps/
COPY --from=frontend /app/frontend/dist/frontend/ /usr/local/tomcat/webapps/frontend/
EXPOSE 8080
CMD ["catalina.sh", "run"]