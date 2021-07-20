---
title: Kubernetes Development Framework (KDF)
type: index
---

## Attention Kubernetes Novices

{{% readfile file="/content/readfiles/learn-progression.md_" markdown="true" %}}

## What is the KDF?

The KDF is a...

- lightweight set of *patterns*, *tools*, and *deployment packages*
- **toolkit**
- **way of doing things**

## What is it not?

The KDF is _not_ a...

- **platform**
- **cloud service**
- **Platform as a Service (PaaS)**
- **set of Kubernetes cluster installation scripts**

## How does it help?

### New Kubernetes Users

Use the KDF to quickly create a cluster with
basic services (e.g. logging, monitoring, HTTPS ingress, LetsEncrypt SSL certs)
by using vetted and tested deployment packages, all while conforming to what we
perceive as healthy patterns.

### Experienced Kubernetes Users

Use the KDF in order to make their
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
    tools pre-configured for that specific environment.  Thus, by opening
    multiple shells to different "cluster" directories the user may be
    configured to operate on several clusters simultaneously.  This sounds
    simple, however it is not possible with "kubectl" today because only a
    single, global kube-context may be active at once.  It is also difficult
    with with other tools (e.g. aws-cli if working across AWS accounts).  Our
    "platform-deploy" code pattern relies on
    [direnv](https://github.com/direnv/direnv) which is pre-configured in the
    [Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk), to
    auto-magically set environment variables upon entering a cluster directory
    and pull secrets from a [keybase](https://keybase.io/) team to properly
    configure all of the cloud tools such as kubectl, helm, aws-cli, etc.
