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
	rm $(FILE).gpg || true
	gpg -c $(FILE)
decrypt: guard-FILE
	rm $(FILE) || true
	gpg -o $(FILE) -d $(FILE).gpg
