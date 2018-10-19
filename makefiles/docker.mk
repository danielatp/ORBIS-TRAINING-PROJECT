.PHONY: docker


define build
	docker build -t danielatp/jenkins-deploy:0.1.0 docker/jenkins
   #docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.
#sock danielatp/jenkins-deploy:0.1.0
endef

## Targets Makefile

docker.build:
	$(call build)

project-workspace:
	echo "project-workspace"
	docker create -v /app --name espacio_de_trabajo alpine
	docker cp ./ espacio_de_trabajo:/app

jenkins-install:
	docker run -t --rm --volumes-from espacio_de_trabajo -w /app ${DOCKER_IMAGE} npm install

jenkins-start:
	docker network create orbis_training_net
	docker run -d --net=orbis_training_net --name node_jenkins_start -p 3030:1042 --volumes-from espacio_de_trabajo -w /app ${DOCKER_IMAGE} npm start

curl:
	echo "curl -> jojo"
	docker run -t --rm --net=orbis_training_net --volumes-from espacio_de_trabajo -w /app ${DOCKER_IMAGE} curl node_jenkins_start:1042

jenkins-release:
	docker run -t --rm --volumes-from espacio_de_trabajo -w /app ${DOCKER_IMAGE} npm run release
	docker cp espacio_de_trabajo:/app/. ./


