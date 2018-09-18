---
title: Concepts
type: index
---

## What is the KDF?

The Kubernetes Development Framework (KDF) is a lightweight set of *patterns*,
*tools*, and *deployment packages*.  It is not a platform.  It is a toolkit and
a way of doing things.

## How will it help?

**New users** of Kubernetes may use the KDF to quickly create a cluster with
basic services (e.g. logging, monitoring, HTTPS ingress, LetsEncrypt SSL certs)
by using vetted and tested deployment packages, all while conforming to what we
perceive as healthy patterns.

**Experienced users** of Kubernetes may use the KDF in order to make their
lives easier and work more efficiently.  For example:

  * Members of a team often spend hours individually setting up and maintaining
    their development and operations environments.  In order to work
    effectively, they should all work in a common environment, using the same
    list of tools, at the same versions.  We provide a cross-platform,
    lightweight, immutable cli tool and docker image that serves as this
    development environment called the [Kubernetes Development Kit
    (KDK)](https://github.com/cisco-sso/kdk).

  * The [platform-deploy](https://github.com/cisco-sso/k8s-deploy) code pattern
    allows a user to enter a "cluster" directory and automatically have all
    tools pre-configured for that specific enviroment.  Thus, by opening
    multiple shells to different "cluster" directories the user may be
    configured to operate on several clusters simultaneously.  This sounds
    simple, however it is not possible with "kubectl" today because only a
    single, global kube-context may be active at once.  It is also difficult
    with with other tools (e.g. aws-cli if working across AWS accounts).  Our
    "platform-deploy" code pattern relies on
    [direnv](https://github.com/direnv/direnv) which is pre-configured in the
    [Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk), to
    auto-magically set enviroment variables upon entering a cluster directory
    and pull secrets from a [keybase](https://keybase.io/) team to properly
    configure all of the cloud tools such as kubectl, helm, aws-cli, etc.

## The KDF is not...

* a **platform**
* a **cloud service**
* a **set of Kubernetes cluster installation scripts**
  - Many existing projects, products, and teams already address this.
