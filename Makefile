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

	@echo ""
	@echo "==== file $(FILE) : START ===="
	@echo ""
	cat $(FILE)
	@echo ""
	@echo "==== file $(FILE) : END ===="
	@echo ""

	gpg --yes -c $(FILE)

	@echo ""
	@echo "==== gpg file $(GPG_FILE) : START ===="
	@echo ""
	@echo $(shell cat $(GPG_FILE))
	@echo ""
	@echo "==== gpg file $(GPG_FILE) : END ===="
	@echo ""

decrypt: guard-FILE
	$(eval GPG_FILE :=$(FILE).gpg)
	@echo "DECRYPT $(GPG_FILE) -> $(FILE)"

	@echo ""
	@echo "==== gpg file $(GPG_FILE) : START ===="
	@echo ""
	cat $(GPG_FILE)
	@echo ""
	@echo "==== gpg file $(GPG_FILE) : END ===="
	@echo ""

	gpg --yes -o $(FILE) -d $(FILE).gpg

	@echo ""
	@echo "==== file $(FILE) : START ===="
	@echo ""
	cat $(FILE)
	@echo ""
	@echo "==== file $(FILE) : END ===="
	@echo ""