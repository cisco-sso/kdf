---
title: Backlog
---

## Roadmap Priorities

1. Dockerized KDK
1. Multi-cluster [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) Configuration
   * e.g. How to manage highly redundant [umbrella charts](https://docs.helm.sh/developing_charts#complex-charts-with-many-dependencies) or [mh](https://github.com/cisco-sso/mh) configs across many kubernetes clusters.
   * Next generation of mh technology, could be something else
1. Kubernetes Individual Identity (Security)
   * OIDC Provider Integration
1. Kubernetes RBAC (Security)
1. Kubernetes Audit logging (Security)
1. Multi-tenant Kubernetes Clusters
   * Per-region Kubernetes clusters
   * Individual Namespaces per project.
1. Service Mesh
   * East/West (intra-cluster)
     * e.g. pod in one cluster can talk to service in another cluster.
   * North/South (cross-cluster / external-to-cluster)
1. Backups/Snapshots
1. Secrets Management
1. Blue/Green deployments
1. Distributed network tracing (Open-Tracing + Istio)


## To be discussed/prioritized:

1. Openstack Autoscale
1. Kubernetes IDS (Falco/Abnormal Auth network traffic/etc...)
1. Hardening around LoadBalancer/NodePort service creation.
1. Dynamic Security Group creation for K8s service neutron ports. (bug in kube-controller-manager)
1. Support for Node-Pools
