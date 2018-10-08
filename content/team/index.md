---
title: Team
---

<div hidden>
TODO

## Agreements

https://rfc.zeromq.org/spec:22/C4/
</div>


## Branch/Merge Strategy

### Github Flow / Fork & Pull (RECOMMENDED)

Modern software development keeps a stable `master` branch.  Releases are tagged directly off of the master branch.
This requires a solid automated test suite and enables quick release cycles.  If your project matches these
characteristics use [Github Flow](https://guides.github.com/introduction/flow/).

### Gitflow

Legacy software development typically uses `release` branches, which take time to stabilize, typically due to
significant manual test bottlenecks.  If your project matches these characteristics use
[GitFlow](https://nvie.com/posts/a-successful-git-branching-model/).


## Pull Requests

There are simple things you can do to get your PRs through the process quickly.

* Don't make GIANT PRs.
* Address one feature at a time.
  * Any single blocker can hold up the entire PR.
* Make your PR address only related items.
* Address PR comments quickly
* Acknowledge every single comment in the PR.
* Fix your merge conflicts quickly
* Review other people's PRs.
  * The more people reviewing, the sooner you can get a "+1- yourself.


## Code Reviews

At minimum:

* Be civil
* Prefix your code comments with: MUST, SHOULD, MAY, or NIT
  * This informs the committer what needs to get fixed, and what is optional.


## Upstreaming

If you modify an open-source project, make the effort to submit an upsteam PR and get your code merged.

This eliminates the long term burden of maintaining forked code, thus reducing costs for your business.  It also is important to contribute to the open-source community.


## Versioning

Please version all software using [Semantic Versioning](https://semver.org/)

## People

We are part of an architecture team at [Cisco](https://www.cisco.com/).  This site is a brain-dump of open-source
learnings, particularly around Docker and Kubernetes.

* David Wang: https://github.com/dcwangmit01
* Josh Dotson: https://github.com/josdotso
* Ryan Luckie: https://github.com/rtluckie
