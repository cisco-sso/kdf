---
title: Helm Charts
---

## Selecting a Helm Chart


* Search for your component using google (e.g. "helm chart elasticsearch")
* Often you will find many charts in for a component.  For example, elasticsearch can be found in 3 popular helm chart
  repositories.
  * [Official Kubernetes Charts](https://github.com/helm/charts/tree/master/incubator/elasticsearch)
  * [Bitnami](https://github.com/bitnami/charts/tree/master/bitnami/elasticsearch)
  * [Clockworksoul](https://github.com/clockworksoul/helm-elasticsearch)
* Read through the values and templates of each chart, and understand how they differ.
* Test the most promising charts
  * In general, favor the charts in the [Official Kubernetes
    Charts](https://github.com/helm/charts/tree/master/incubator/elasticsearch) because they are the most actively
    contributed to.
* Run [Chaoskube](https://github.com/helm/charts/tree/master/stable/chaoskube) against the deployed chart resources and
  ensure the resources always recover.
  * For example, once chaoskube killed the [consul chart](https://github.com/helm/charts/tree/master/stable/consul)
    deployment over 1000 times overnight, and the service always recovered, we considered it stable
    enough to deploy in our system.
  * If a chart deployment does not survive repeated chaoskube kills, then submit [upstream](/team/#upstreaming) bugfixes
    to make the chart better before using it in the system.


## Helm Chart Code Review

Generic considerations may include:

* Ensure anything that should be configurable is parameterized (e.g. replicas, image, version)
* Ensure a statefulset is used if a PVC is referenced
* Ensure container memory limits and cpu limits are set to recommendations but commented out.
  * A default chart must not have these set because it decreases the chances the chart will work as default.
  * In a real deployment, these settings **must** be defined via overrides.
* Ensure priorityclass is set.
* Ensure RBAC service accounts, roles, and rolebindings are configured by the chart
* If the service is Java, ensure Xmx and Xms are set to be the same

TIP: When creating a helm chart from scratch, use the helm command itself, which will auto-create a generic boilerplate
for you `helm create <my-new-chart>`
