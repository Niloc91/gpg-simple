# gpg-simple
simple password encryption

Includes gitignore file to ignore decrypted yml file

# Decrypt
`$ make decrypt FILE=password.secret.yml`

password `12345`


# Encrypt
`$ make encrypt FILE=password.secret.yml`

Will output decrypted yml file from file named
`password.secret.yml.gpg`




when prompted type in paraphase


file must be named
`password.secret.decrypt.yml` 
