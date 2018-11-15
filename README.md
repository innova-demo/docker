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