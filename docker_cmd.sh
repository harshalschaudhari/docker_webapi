#Step 1: Build docker Image
docker build --rm -f "dockerfile" -t docker_webapi:v2 .

#Step 2: Verify docker Image
docker images

#Step 3: Run docker Image
#Explanation: docker run --name <container-name> -d -p <external-port>:<container-internal-port> <docker-image-name>:<tag-name>
docker run --name temp-dockerwebapi2 -d -p 8082:80 docker_webapi:v2

#Step 3.1 Map local docker image to GitHub artifactory
docker tag docker_webapi:v2 harshalschaudhari/dockerwebapi

#Step 3.2 Push local docker image to GitHub artifactory
docker push harshalschaudhari/dockerwebapi

#Step 3.3 : Create thefile docker-compose.yml

#Step 4: Run docker Image based on YAML (Should be in current folder of docker-compose.yml)
docker-compose up

