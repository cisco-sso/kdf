---
title: Backlog
---

## Roadmap Priorities

1. [Done] Dockerized KDK
1. [In Progress] KDF Docs
1. [In Progress] Multi-cluster [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) Configuration
   * e.g. How to manage highly redundant [umbrella charts](https://docs.helm.sh/developing_charts#complex-charts-with-many-dependencies) or [mh](https://github.com/cisco-sso/mh) configs across many kubernetes clusters.
   * Next generation of mh technology, could be something else
1. Kubernetes Individual Identity (Security)
   * OIDC Provider Integration
1. Kubernetes RBAC (Security)
1. Kubernetes Audit logging (Security)
1. Multi-tenant Kubernetes Clusters
   * Per-region Kubernetes clusters
   * Individual Namespaces per project.
1. Service Mesh (Security)
   * East/West (intra-cluster)
     * e.g. pod in one cluster can talk to service in another cluster.
   * North/South (cross-cluster / external-to-cluster)
     * Traffic encryption and authorization at sidecar container pod level
1. Backups/Snapshots
1. Secrets Management
   * Vault
1. Distributed network tracing (Open-Tracing + Istio)
1. Blue/Green deployments
1. Kafka streaming platform
   * Accounting, cross-cluster mirroring, security, multi-tenancy, entitlement, etc.
1. Kubernetes on Openstack encryption at rest
   * Node volumdes such as Etcd, and Kubernetes PVs

## To be discussed/prioritized:

1. Openstack Autoscale
1. Kubernetes IDS (Falco/Abnormal Auth network traffic/etc...)
1. Hardening around LoadBalancer/NodePort service creation.
1. Dynamic Security Group creation for K8s service neutron ports. (bug in kube-controller-manager)
1. Support for Node-Pools
