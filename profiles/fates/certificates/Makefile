CA_PREFIX	 := ca
CA		 := $(CA_PREFIX).pem
CA_KEY		 := $(CA_PREFIX).key
CA_SRL           := $(CA_PREFIX).srl

CERTIFICATES     = etcd etcd-peer kubernetes-etcd kubelet-client kubernetes-proxy
SSL_CONF         = openssl.conf
DEFAULT_BITS     = 4096
EXPIRE_DAYS      = 10000

.PHONY: clean
clean:
	rm -f $(CERTIFICATES:%=%.csr) $(CERTIFICATES:%=%.key) $(CERTIFICATES:%=%.pem)
	rm -f $(CA_KEY) $(CA) $(CA_SRL)

.PHONY: certificates
certificates: $(CERTIFICATES:%=%.key) $(CERTIFICATES:%=%.pem)

%.pem: %.csr %.key $(CA) $(CA_KEY)
	openssl x509 -days $(EXPIRE_DAYS) -in $< -out $@ -CA $(CA) -CAkey $(CA_KEY) -CAcreateserial -req -extfile $(SSL_CONF) -extensions 'v3_req'

%.csr: %.key
	openssl req -key $< -new -out $@ -config $(SSL_CONF)

%.key:
	openssl genrsa -out $@ $(DEFAULT_BITS)

$(CA): $(CA_KEY)
	openssl req -x509 -days $(EXPIRE_DAYS) -new -nodes -key $< -out $@ -config $(SSL_CONF)

$(CA_KEY):
	openssl genrsa -out $@ $(DEFAULT_BITS)
