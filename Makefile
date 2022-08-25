.ONESHELL:

SHELL := /bin/bash
DATE_ID := $(shell date +"%y.%m.%d")
# Get package name from pwd
PACKAGE_NAME := $(shell basename $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))
.DEFAULT_GOAL := help

# UPDATE ME
DOCKER_IMAGE = "$(USER)/$(shell basename $(CURDIR))"

define PRINT_HELP_PYSCRIPT
import re, sys

class Style:
    BLACK = '\033[30m'
    BLUE = '\033[34m'
    BOLD = '\033[1m'
    CYAN = '\033[36m'
    GREEN = '\033[32m'
    MAGENTA = '\033[35m'
    RED = '\033[31m'
    WHITE = '\033[37m'
    YELLOW = '\033[33m'
    ENDC = '\033[0m'

print(f"{Style.BOLD}Please use `make <target>` where <target> is one of{Style.ENDC}")
for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if line.startswith("# -------"):
		print(f"\n{Style.RED}{line}{Style.ENDC}")
	if match:
		target, help_msg = match.groups()
		if not target.startswith('--'):
			print(f"{Style.BOLD+Style.GREEN}{target:20}{Style.ENDC} - {help_msg}")
endef

export PRINT_HELP_PYSCRIPT
# See: https://docs.python.org/3/using/cmdline.html#envvar-PYTHONWARNINGS
export PYTHONWARNINGS=ignore
BROWSER := $(PYTHON) -c "$$BROWSER_PYSCRIPT"


# If you want a specific Python interpreter define it as an envvar
# $ export PYTHON_ENV=
ifdef PYTHON_ENV
	PYTHON := $(PYTHON_ENV)
else
	PYTHON := python3
endif

#################################### Functions ###########################################
# Function to check if package is installed else install it.
define install-pkg-if-not-exist
	@for pkg in ${1}; do \
		if ! command -v "$${pkg}" >/dev/null 2>&1; then \
			echo "installing $${pkg}"; \
			$(PYTHON) -m pip install $${pkg}; \
		fi;\
	done
endef

# Function to create python virtualenv if it doesn't exist
define create-venv
	$(call install-pkg-if-not-exist,virtualenv)

	@if [ ! -d ".$(PACKAGE_NAME)_venv" ]; then \
		$(PYTHON) -m virtualenv ".$(PACKAGE_NAME)_venv" -p $(PYTHON) -q; \
		echo "\".$(PACKAGE_NAME)_venv\": Created successfully!"; \
	fi;
	@echo "Source virtual environment before tinkering"
	@echo "Manually run: \`source .$(PACKAGE_NAME)_venv/bin/activate\`"
endef

define add-gitignore
	PKGS=venv,python,JupyterNotebooks,SublimeText,VisualStudioCode,vagrant
	curl -sL https://www.gitignore.io/api/$${PKGS} > .gitignore
endef

# .PHONY: all
help:
	@$(PYTHON) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

# ------------------------------------ Boilerplate Code ----------------------------------
boilerplate:  ## Add simple 'README.md' and .gitignore
	@echo "# $(PACKAGE_NAME)" | sed 's/_/ /g' >> README.md
	@$(call add-gitignore)

# -------------------------------- Builds and Installations -----------------------------

venv:  ## Create virtualenv environment on local directory.
	@$(create-venv)

pyenv-venv: ## Setup pyenv virtualenv environment
	pyenv local 3.8.5
	pyenv exec pip install virtualenv
	pyenv exec virtualenv venv
	@echo "Source virtual environment before tinkering"
	@echo "Manually run: \`source venv/bin/activate\`"

dev-install: ## install dev packages
	python -m pip install .[dev];

install-req: ## install from requirements file
	python -m pip install -r requirements.txt

# -------------------------------------- Project Execution -------------------------------
run-in-docker:  ## Run python app in a docker container
# docker run --rm -ti --volume "$(CURDIR)":/app $(DOCKER_IMAGE) \
# bash -c "$(PYTHON) $(MAIN_FILE)"
	docker-compose up --build


# -------------------------------------- Clean Up  --------------------------------------
.PHONY: clean
clean: clean-build clean-pyc clean-test clean-docker ## Remove all build, test, coverage and Python artefacts

clean-build: ## Remove build artefacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -fr {} +
	find . -name '*.xml' -exec rm -fr {} +

clean-pyc: ## Remove Python file artefacts
	find . -name '*.pyc' -exec rm -rf {} +
	find . -name '*.pyo' -exec rm -rf {} +
	find . -name '*~' -exec rm -rf {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## Remove test and coverage artefacts
	rm -fr .$(PACKAGE_NAME)_venv
	rm -fr .tox/
	rm -fr .pytest_cache
	rm -fr .mypy_cache
	rm -fr .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

clean-docker:  ## Remove docker image
	if docker images | grep $(PACKAGE_NAME)_*; then \
	  docker rmi postgres:11 || true;\
	 	docker rmi $(PACKAGE_NAME)_api || true;\
		docker rmi $(PACKAGE_NAME)_web || true;\
	fi;

# -------------------------------------- Code Style  -------------------------------------

lint: ## Check style with `flake8` and `mypy`
	$(call install-pkg-if-not-exist,flake8)

	@$(PYTHON) -m flake8 rest_auth/
# find . -name "*.py" | xargs pre-commit run -c .configs/.pre-commit-config.yaml flake8 --files
# @$(PYTHON) -m mypy
# @yamllint .

checkmake:  ## Check Makefile style with `checkmake`
	docker run --rm -v $(CURDIR):/data cytopia/checkmake Makefile

formatter: ## Format style with `black` and sort imports with `isort`
	$(call install-pkg-if-not-exist,black)
	$(call install-pkg-if-not-exist,isort)
	@isort -m 3 -tc -rc .
	@black .
# 	find . -name "*.py" | xargs pre-commit run -c .configs/.pre-commit-config.yaml isort --files

# ---------------------------------------- Tests -----------------------------------------
.PHONY: test
test: ## Run tests quickly with pytest
	$(call install-pkg-if-not-exist,pytest)
	$(PYTHON) -m pytest -sv
	# $(PYTHON) -m nose -sv

# ---------------------------------------- Release ---------------------------------------
.PHONY: release
release:
	@git checkout ${commit}
	@git tag -a "${version}" -m "Release tag for version ${version}"
	@git checkout -
	@git push origin ${version}
	@python get_latest_release_changelog.py
	@gh release create ${version} -F latest_release_changelog.md


precommit: 		## Python precommit checks (lint, security, tests)
	@$(MAKE) lint
	@$(MAKE) security
	@$(MAKE) test-coverage
	@echo "You're good to go 🎉"