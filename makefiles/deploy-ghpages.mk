.PHONY: deploy.ghpages
DEPLOY_DIR = deploy
BUILD_DIR = build
GIT_BRANCH = gh-pages
GIT_PERSONAL_TOKEN = 1558ef7233b87355eeaf31f5cc08fc9e030de11c

define mkdir_deploy_dir
    @if [ ! -d "$(GIT_BRANCH_DIR)" ]; then mkdir $(GIT_BRANCH_DIR); fi
endef

define git_init
    @cd $(GIT_BRANCH_DIR) && \
     rm -rf $(GIT_BRANCH_DIR)/.git && \
     git init
endef

define git_config
    $(eval GIT_USER_NAME := $(shell git log --pretty=format:"%an" | head -n 1))
    $(eval GIT_USER_EMAIL := $(shell git log --pretty=format:"%ae" | head -n 1))
    @cd $(GIT_BRANCH_DIR) && \
     git config user.email "$(GIT_USER_EMAIL)" && \
     git config user.name "$(GIT_USER_NAME)"
endef

define git_add_remote_repository
    $(eval REPOSITORY := $(shell git remote -v | grep origin | grep '(push)'| awk '{print $$2}'))
    $(eval GIT_REPOSITORY_REMOTE := $(shell echo $(REPOSITORY) | sed 's%https://%https://$(GIT_PERSONAL_TOKEN)@%g'))
    @cd $(GIT_BRANCH_DIR) && \
     git remote add origin $(GIT_REPOSITORY_REMOTE)
endef

define create_branch_gh_pages
    @cd $(GIT_BRANCH_DIR) && \
     git checkout -b $(GIT_BRANCH)
endef

GIT_BRANCH_DIR = $(PWD)/$(DEPLOY_DIR)/$(GIT_BRANCH)

deploy.ghpages:
	@echo 'Deploy to gh-pages...'
	$(call mkdir_deploy_dir)

git.init:
	@echo "Voy a deployar el git init"
	$(call git_init)

git.config:
	@echo "Configurando usuario de git"
	$(call git_config)

git.add-remote:
	$(call git_add_remote_repository)
	
git.create-branch:
	$(call create_branch_gh_pages)

