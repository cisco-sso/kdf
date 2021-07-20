---
title: Deploying
---

## Intro

If you want to install kubernetes on anything but your local machine, but have never used kubernetes... **stop**.  There
are countless technologies which may be used to deploy Kubernetes in all sorts of clouds and on-premise setups.  People
get stuck on the installation, and the resulting kubernetes clusters are often divergent from what kubernetes was meant
to be.  Worse yet, a novice may not notice.  For example, on-premise deployments of kubernetes, given the constraints of
a corporate datacenter, may be missing persistent storage and loadbalancers which most applications built for kubernetes
typically depend on.


## Learn via Progression

{{% readfile file="/content/readfiles/learn-progression.md_" markdown="true" %}}

Afterwards, any attempts to deploy Kubernetes in the cloud or on-premise will be better understood given the
environmental constraints.


## Deployment Considerations

On-premise, bare-metal, and single node kubernetes deployments are often missing the following infrastructure, which
decrease the benefits of Kubernetes and make it difficult for most applications which expect this basic Kubernetes
functionality.

* Persistent network storage and storage class provisioners
  * Without this, pods which rely on persistent storage are stuck on a single worker node and cannot migrate to another
    worker node.  Its persistent volume is local to a node and cannot be network mounted on a different worker node.
    This drastically decreases the resilience of any stateful application in Kubernetes upon node failures.
* Load-balancer integration
  * Without this, applications within kubernetes will not be auto-wired to be reachable from outside of Kubernetes.

There are less resilient and unpalatable workarounds for the above, for example:

* As a workaround for the lack of persistent network storage, we have run [OpenEBS](https://www.openebs.io/), but found
  them difficult due to skillset requirements and operational efforts.  We created proof-of-concepts with
  [CephRBD](https://ceph.com/), but found you really need a dedicated team to operate it.

* As a workaround for the lack of load-balancer integration, we have run Ingress as a Nodeport Dameonset, and added all
  node records to an DNS A-record.  This works, but does not auto-wire upon node failures or additions such as during
  autoscale events.


## Local Devenv

Kubernetes deployments on your development machine can be made to feel very much like a Gold Standard Kubernetes
cluster, if you jump through a few hoops.  We've created tools and a turnkey set of instructions to help you get this
going with good practices and patterns.  Documentation may be found in our [KDF Getting
Started](https://kdf.csco.cloud/getting-started) documentation.

**Recommendations**

Mac

* [Docker for Mac](https://www.docker.com/products/docker-desktop) (includes Kubernetes)
  * Turnkey instructions which get you going with good practices and patterns
    * https://kdf.csco.cloud/getting-started/mac/
* [Minikube](https://kubernetes.io/docs/setup/minikube/)
  * We prefer Docker for Desktop over Minikube, because its single-click install, defaults, integration, and UI are all
    better for novices.

Windows

* [Docker for Windows](https://www.docker.com/products/docker-desktop) (includes Kubernetes)
  * Turnkey instructions which get you going with good practices and patterns
    * https://kdf.csco.cloud/getting-started/windows/
* [Minikube](https://kubernetes.io/docs/setup/minikube/)
  * We prefer Docker for Desktop over Minikube, because its single-click install, defaults, integration, and UI are all
    better for novices.

Linux

* [Minikube](https://kubernetes.io/docs/setup/minikube/)
  * We've had success with [Minikube](https://kubernetes.io/docs/setup/minikube/) on linux.
* [Kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/)
  * The Kubeadm project has made a lot of progress recently.  It is the core installer technology used by other
    installers such as Kubespray.  We haven't tried it in a while, but would revisit it.
* [Microk8s](https://microk8s.io/)
  * Microk8s is a newcomer.  We haven't tried it yet, but it is definitely worth considering.


## Single Node Cluster

There are quite a few technologies for setting up a single node kubernetes cluster for production.

**Recommendations**

* [Kubespray](https://github.com/kubernetes-incubator/kubespray)
  * Kubespray is an Ansible-based installer, which may be directed at a single node or multiple nodes.  It takes care of
    OS level configurations, and will eventually be default-configured to drive Kubeadm for the actual installing of
    kubernetes services.

* [Kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)
  * Seems to be where the momentum is for kubernetes core installation functionality.

* [Minikube](https://kubernetes.io/docs/setup/minikube/) is *NOT* recommended.
  The project is targeted only for development, and by default will not persist state between reboots.

## Google GKE

This is our #1 choice for Kubernetes in the cloud.

* [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/)


## AWS

AWS with Kops is our #2 choice for Kubernetes in the cloud.

* [Kops](https://github.com/kubernetes/kops)
  * We have years of experience deploying with Kops.  Kops has been around for quite a while as the only option for AWS,
    and it has functioned solidly.  It's a highly-recommended open-source project.
* [Amazon Elastic Container Service (EKS)](https://aws.amazon.com/eks)
  * Amazon EKS is a newcomer.  We haven't tried it yet, but it is definitely worth considering.

## Bare Metal / Pre-Provisioned

Bare Metal and other Pre-Provisioned machines can be installed with Kubespray.

* [Kubespray](https://github.com/kubernetes-incubator/kubespray)
  * Kubespray is an Ansible-based installer, which may be directed at a single node or multiple nodes.


## Openstack

This installation process is the same as Bare Metal, however first the machines must be pre-provisioned using Terraform

* [Kubespray Contrib Openstack Terraform Code](https://github.com/kubernetes-incubator/kubespray/tree/master/contrib/terraform/openstack)
  * This section of the Kubespray repository contains terraform which can create pre-provisioned machines in an Openstack VPC.
* Once the machines are provisioned, follow the recommendation in the [Bare Metal / Pre-Provisioned
  machines](#bare-metal-pre-provisioned) section above.


## Vsphere

This installation process is the same as Bare Metal, however first the machines must be pre-provisioned using Terraform

* [Vshpere Terraform Provider](https://www.terraform.io/docs/providers/vsphere/index.html)
  * Here's a guide for writing Vsphere Terraform code:
    https://www.hashicorp.com/blog/a-re-introduction-to-the-terraform-vsphere-provider
* Once the machines are provisioned, follow the recommendation in the [Bare Metal / Pre-Provisioned
  machines](#bare-metal-pre-provisioned) section above.
