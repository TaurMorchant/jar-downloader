DEPS_FILE=artifacts.txt
OUTPUT_DIR=libs

GREEN=\033[0;32m
RED=\033[0;31m
YELLOW=\033[0;33m
RESET=\033[0m

download-jars:
	mkdir -p $(OUTPUT_DIR)
	@while IFS= read -r dep || [ -n "$$dep" ]; do \
		printf "${YELLOW}Downloading $$dep ${RESET}\n"; \
		mvn dependency:copy -Dartifact=$$dep -DoutputDirectory=$(OUTPUT_DIR) -Dtransitive=false --settings=$(CURDIR)/.m2/setting-public-only.xml -Dmaven.repo.local=$(CURDIR)/.m2/repository-public-only; \
	done < $(DEPS_FILE)