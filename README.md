## dexplex-container

dexplex image built with ubuntu LTS base  

build locall image  
docker build -t dexplex .  

build image for docker hub  
docker build -t piggyho/dexplex .  

to run only the dexplex image  
docker run -ti dexplex start -h       # help  
docker run -ti dexplex start -f       # run in forground, add -d to no disable stdout and stderr  

docker start -a dexplex -ti -v docker/dexplex/logs:/dexplex/logs dexplex start -f -d  

docker tag piggyho/dexplex:latest piggyho/dexplex:tag  
docker login  
docker push piggyho/dexplex:tagname  

compose  
----------  
compose uses caddy as a https proxy  
dexplex listen (see config) on 8080 (for example)  

run the setup scipt to make the host dirs for the container volumes  

  
docker-compose up  
docker-compose up -d    - detached  
docker-compose down  

the compose file has command: start -f, if you want to keep stdout & stderr open then ue command: start -f -d  


