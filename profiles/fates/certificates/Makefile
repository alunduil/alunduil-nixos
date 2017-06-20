CERT_EXPIRE_DAYS = "365"

generate-certs: fates-san fates-cert

fates-san: rootca.pem
	for service in etcd etcd-peer kubernetes-etcd; \
	  do openssl req -x509 -nodes -days ${CERT_EXPIRE_DAYS} -newkey rsa:2048 -keyout $$service.key -out $$service.pem -config san-req.conf -extensions 'v3_req'; \
	done

fates-cert: rootca.pem
	for service in kubelet-client kubernetes-proxy; \
	  do openssl req -x509 -nodes -days ${CERT_EXPIRE_DAYS} -newkey rsa:2048 -keyout $$service.key -out $$service.pem -subj "/CN=fates"; \
	done

rootca.pem: rootca.key
	openssl req -x509 -new -nodes -key ca.key -days 10000 -out ca.pem -subj "/CN=fates-ca"

rootca.key:
	openssl genrsa -out ca.key 4096
