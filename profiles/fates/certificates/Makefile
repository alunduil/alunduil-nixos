ca.pem: ca.key
	openssl req -x509 -new -nodes -key ca.key -days 10000 -out ca.pem -subj "/CN=fates-ca"

ca.key:
	openssl genrsa -out ca.key 4096

.PHONY: clean
clean:
	rm -f *.key *.csr *.pem
