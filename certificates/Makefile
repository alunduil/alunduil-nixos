CFSSL ?= cfssl
CFSSLJSON ?= cfssljson

CA_PREFIX := alunduil-ca
CA_CONFIG := $(CA_PREFIX)-config.json
CA_CSR    := $(CA_PREFIX)-csr.json
CA        := $(CA_PREFIX).pem
CA_KEY    := $(CA_PREFIX)-key.pem

GENCRT := $(CFSSL) gencert -ca=$(CA) -ca-key=$(CA_KEY) -config=$(CA_CONFIG) -profile=kubernetes

CERTIFICATES = cronus-admin cronus-proxy cronus-kubernetes

.PHONY: all
all: $(CERTIFICATES:%=%.pem) $(CERTIFICATES:%=%-key.pem)

.PHONY: clean
clean: 
	rm -f $(CERTIFICATES:%=%.pem) $(CERTIFICATES:%=%-key.pem) $(CERTIFICATES:%=%.csr)
	rm -f $(CA_KEY) $(CA) $(CA_PREFIX).csr

$(CA_KEY) $(CA): $(CA_CSR)
	$(CFSSL) gencert -initca $< | $(CFSSLJSON) -bare $(CA_PREFIX)

%-key.pem %.pem %.csr: %-csr.json $(CA) $(CA_KEY) $(CA_CONFIG)
	$(GENCRT) $< | $(CFSSLJSON) -bare $(<:%-csr.json=%)
