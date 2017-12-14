USAGE="USAGE ..."
guard-%:
	@if [ "${${*}}" == "" ]; then \
			echo "CONFIGURATION ERROR! Environment variable $* not set"; \
			echo "USAGE : $(USAGE)"; \
			exit 1; \
	fi

usage:
	echo "USAGE : $(USAGE)";

encrypt: guard-FILE
	$(eval GPG_FILE :=$(FILE).gpg)
	@echo "ENCRYPT $(FILE) -> $(GPG_FILE)"
	@echo "==== file $(FILE) : START ===="
	cat $(FILE)
	@echo "==== file $(FILE) : END ===="
	gpg --yes -c $(FILE)
	@echo "==== gpg file $(GPG_FILE) : START ===="
	cat $(GPG_FILE)
	@echo "==== gpg file $(GPG_FILE) : END ===="
decrypt: guard-FILE
	$(eval GPG_FILE :=$(FILE).gpg)
	@echo "DECRYPT $(GPG_FILE) -> $(FILE)"
	@echo "==== gpg file $(GPG_FILE) : START ===="
	cat $(GPG_FILE)
	@echo "==== gpg file $(GPG_FILE) : END ===="
	gpg --yes -o $(FILE) -d $(FILE).gpg
	@echo "==== file $(FILE) : START ===="
	cat $(FILE)
	@echo "==== file $(FILE) : END ===="