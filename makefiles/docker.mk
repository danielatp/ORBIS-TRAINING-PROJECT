.PHONY: docker


define build
	docker build -t danielatp/jenkins-deploy:0.1.0 docker/jenkins
   
endef

## Targets Makefile

docker.build:
	$(call build)

project-workspace:
	echo "project-workspace"

curl:
	echo "curl"


