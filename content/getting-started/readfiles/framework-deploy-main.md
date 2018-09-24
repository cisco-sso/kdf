(inside your KDK container)

### Clone the [framework-deploy](https://github.com/cisco-sso/framework-deploy) repo using git.

```bash
#### Run this command if you have configured your GitHub account for public key SSH.
git clone git@github.com:cisco-sso/framework-deploy.git

#### (OR) Run this command if you have not configured GitHub for public key SSH.
git clone https://github.com/cisco-sso/framework-deploy.git
```

### Change to the `framework-deploy` directory and take a look around.

```bash
cd framework-deploy/
ls -a
```

You should see:
```bash
.  ..  .envrc  .git  .gitignore  LICENSE  README.md  apps  bin  clusters  ensure-env.sh
```

- `.envrc`

Upon entering a directory that contains an `.envrc` file, the `direnv` tool installed in the KDK container will
automatically source the `./.envrc` file if it is present.

For example, in the framework-deploy pattern, `direnv` tunes your shell's environment variables for each cluster
directory into which you change (`cd`).

If `direnv` encounters a `.envrc` file it has not previously processed, or one that has changed since last seen, `direnv`
will prompt you to approve the processing of its content.

```
direnv: error .envrc is blocked. Run `direnv allow` to approve its content.
```

At prompts like this, if you're confident that the `.envrc` file is safe for `direnv` to process, run `direnv allow`
to do so.

- `.git`

The `.git` directory holds files that `git` uses. You will likely never need to interact directly with this directory.

- `.gitignore`

The `.gitignore` file tracks which file names `git` should ignore when doing `git add` commands.

- `LICENSE` and `README.md`

These are standard fare license and high level documentation for the framework-deploy project.

- `apps`

The `apps` directory contains template files for the [mh](https://github.com/cisco-sso/mh) command. Each "app" is a template of a Helm chart override.

- `bin`

The `bin` directory contains scripts that simplify specific operations. For example, `bin/get-password-grafana.sh` is a
helper script that retrieves the auto-generated admin password for [grafana](https://grafana.com/) as installed by
framework-deploy.

- `clusters`

The `clusters` directory contains a directory for each Kubernetes cluster you manage with framework-deploy. The
framework-deploy repo contains boilerplate for the `docker-for-desktop` Kubernetes cluster you can easily spin
on macOS and Windows Docker installs.

In an internal and private fork of framework-deploy, you can make cluster directories for your own Kubernetes clusters
such as `myorg1-dev.example.org`. Each cluster directory gets an `.envrc` that can automatically configure your
shell's `KUBECONFIG` environment variable. In the framework-deploy pattern, Kubernetes cluster context name and
KUBECONFIG filename are both set to the cluster's external FQDN (e.g. `myorg1-dev.example.org`). This naming
convention enables the framework-deploy automation to simplify interactive cluster usage.

- `ensure-env.sh`

The `ensure-env.sh` script ensures presence of all prerequisite shell environment variables and tools. The script is
normally `source`'ed by `.envrc` files.

### Allow [direnv](https://direnv.net/) to source the [.envrc](https://github.com/cisco-sso/framework-deploy/blob/master/.envrc) file.

```bash
direnv allow
```

### Change to the `clusters/docker-for-desktop` directory and take a look around.

```bash
cd clusters/docker-for-desktop
ls -a
```

You should see:
```bash
.  ..  .envrc  README.md  mh  vars.yaml
direnv: error .envrc is blocked. Run `direnv allow` to approve its content. 
```

- `.envrc`

The `.envrc` file in this directory is a symlink to `../common/dot.envrc`. The `dot.envrc` file behind the symlink
configures your shell for the current cluster directory name. In this case, that means `docker-for-desktop` 

- `README.md`

The `README.md` in this directory contains guidance specific to the `docker-for-desktop` Kubernetes cluster.

- `mh/main.yaml`

The [mh](https://github.com/cisco-sso/mh) tool which ships with the KDK container iamge is capable of managing one or
many Kubernetes namespaces in a single `MH_CONFIG`.

The `mh/main.yaml` file inside the `mh` directory is the [MH_CONFIG](https://github.com/cisco-sso/mh#select-a-mh-config)
file for the `docker-for-desktop` Kubernetes cluster.

This file declares the cluster's Helm Chart releases, `mh` apps (Helm Chart override templates), and base truth. 
Secret base truth is one exception. Secrets should never be committed to framework-deploy nor any fork of it. Any
secrets seen in this boilerplate version of the repo are for illustrative purposes.

Instead of writing secrets into your `mh/main.yaml`, you may pre-load them as Kubernetes Secrets and make your Helm
Charts use those out of band secrets directly. Another way to manage secrets is to use Helm Charts that generate
secrets into Kubernetes and use them there as needed. Once generated, your Kubernetes user should be able to read them
back out using `kubectl`.

- `vars.yaml`

The `vars.yaml` file stores some very basic key values for tools like
[awake](https://github.com/cisco-sso/kdk/blob/master/files/usr/local/bin/awake) and
[yq](https://yq.readthedocs.io/en/latest/) to draw upon. In the framework-deploy pattern, we use `vars.yaml` to declare
which [keybase.io](http://keybase.io) team manages each cluster.


### Allow [direnv](https://direnv.net/) to source the [.envrc](https://github.com/cisco-sso/framework-deploy/blob/master/clusters/common/dot.envrc) file.

```bash
direnv allow
```

TODO: To be continued...
