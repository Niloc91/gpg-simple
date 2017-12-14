
encrypt:
	gpg -c password.secret.decrypt.yml	
decrypt:
	gpg -o  password.secret.decrypt.yml -d password.secret.yml.gpg
