ca.pem ca-key.pem ca.csr: ca-csr.json
	cfssl gencert -initca $< | cfssljson -bare ca

.PHONY: clean
clean:
	rm -f *.csr *.pem
