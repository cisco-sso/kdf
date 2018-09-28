# Kubernetes Development Framework (KDF)

This repository is the source code for the website found here:

[https://kdf.csco.cloud/](https://kdf.csco.cloud/)

It is a statically generated website using the [Hugo Framework](https://gohugo.io/), hosted on [Github Pages](https://pages.github.com/), using [LetsEncrypt](https://letsencrypt.org/) for dynamically generated SSL certificates.


## Development

Use the Makefile to help you develop and publish this website.

```bash
# make
submodule                      Initialize and update submodules.
develop                        Start the development webserver
build                          Build the website to ./public
publish                        Build and push the website to ghpages
help                           Print list of Makefile targets
```
