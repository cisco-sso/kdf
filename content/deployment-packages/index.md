---
title: Deployment Packages
---

Deployment Packages (Helm Charts) (components list)

All changes to deployment packages were upstreamed.

<div hidden>
How to generate parts of this doc:
git checkout git@github.com:cisco-sso/framework-deploy.git
cd framework-deploy/apps
ls | awk -F'-' '{OFS="-";NF--;print "- " $0;}'|sort | uniq
</div>

- cassandra
- cert-manager
- cert-manager-configs
- chaoskube
- cluster-autoscaler
- consul
- docker-registry
- drone
- elasticsearch
- elasticsearch-curator
- elasticsearch-exporter
- envoy
- external-dns
- filebeat
- filebeat-elasticsearch
- grafana
- hackmd
- kafka
- kafka-manager
- kafka-rest
- kafka-schema-registry
- kibana
- logstash
- metallb
- metrics-server
- minio
- mysql
- nginx-ingress
- nginx-reverse-proxy
- oauth2-proxy
- openebs
- prometheus
- raw
- redis
- redis-ha
- stolon
- ureplicator
- vault
