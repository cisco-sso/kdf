[Framework-deploy](https://github.com/cisco-sso/framework-deploy) is a git repo which implments the KDF deployment
pattern. The boilerplate structure in framework-deploy is made to fit perfectly with the tools available in the KDK
container.

Create a private fork of framework-deploy and use it to hold non-secret Kubernetes-related application configuration
files and templates. In the KDF pattern, templates and configuration files for tools like
[mh](https://github.com/cisco-sso/mh) are hosted in a private fork of framework-deploy. `mh` allows you to template and
deploy [Helm Chart](https://docs.helm.sh/developing_charts) values overrides.
