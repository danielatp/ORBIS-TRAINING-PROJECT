.PHONY: deploy.aws

ENV            ?= dev
DEPLOY_DIR      = deploy
BUILD_DIR       = build
DEPLOY_REGION  ?= eu-west-1
DEPLOY_BUCKET   = $(ENV)-orbis-training

define get_user_name
    $(eval GIT_REPOSITORY_REMOTE := $(shell git remote -v | grep origin | grep '(push)'| awk '{print $2}'))
    $(eval GIT_REPOSITORY_REMOTE_SSH := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | grep 'git@'))

    #$(ifeq ($(strip $(GIT_REPOSITORY_REMOTE_SSH)),), \
    #    $(eval GIT_USER_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 1 | cut -d ":" -f 2)), \
    #    $(eval GIT_USER_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 4)) \
    #)
endef

define deploy_bucket
    $(eval GIT_USER_NAME := $(shell echo '$(GIT_REPOSITORY_REMOTE)' | cut -d "/" -f 1 | cut -d ":" -f 2))

    @aws s3 sync \
    ${PWD}/${DEPLOY_DIR}/${BUILD_DIR} \
    s3://${DEPLOY_BUCKET}/${GIT_USER_NAME} \
    --delete \
    --acl public-read \
    --region ${DEPLOY_REGION}
endef

define show_deploy_url
    @echo ""
    @echo "Publicado en: https://training.orbis.pe/$(GIT_USER_NAME)/index.html"
    @echo ""
endef



deploy.aws: ## Desplegando bucket.: make deploy.aws
	@echo "Desplegando cambios al bucket: $(DEPLOY_BUCKET)"
	$(call get_user_name)
	$(call deploy_bucket)
	$(call show_deploy_url)
