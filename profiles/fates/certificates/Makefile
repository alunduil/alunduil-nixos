CFSSL     ?= cfssl
CFSSLJSON ?= cfssljson

CA_CONFIG := ca-config.json

CA_CERT   := ca.pem
CA_CSR    := ca.csr
CA_KEY    := ca-key.pem

NAMES     := admin api atropos-kubernetes clothio-kubernetes lachesis-kubernetes proxy

CERTS     := $(NAMES:%=%.pem)
CSRS      := $(NAMES:%=%.csr)
KEYS      := $(NAMES:%=%-key.pem)

.PHONY: all
all: $(CERTS) $(KEYS)

.PHONY: clean
clean:
	rm -f $(CERTS) $(CSRS) $(KEYS)
	rm -f $(CA_CERT) $(CA_CSR) $(CA_KEY)

$(CA_CERT) $(CA_CSR) $(CA_KEY): ca-csr.json
	$(CFSSL) gencert -loglevel 2 -initca $< | $(CFSSLJSON) -bare ca

%.pem %.csr %-key.pem: %-csr.json ca.pem ca-key.pem ca-config.json
	$(CFSSL) gencert -loglevel 2 -ca $(CA_CERT) -ca-key $(CA_KEY) -config ca-config.json -profile kubernetes $< | $(CFSSLJSON) -bare $(<:%-csr.json=%)
