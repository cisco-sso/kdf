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

Upon entering a directory that contains an `.envrc` file, the `direnv` tool installed within the KDK container will
automatically source the `./.envrc` file if it is present.

In the framework-deploy pattern, `direnv` sets your shell's environment variables for each cluster directory into which
you change (`cd`). It is through these environment variables that all of the tools are configured (e.g. `kubectl`,
`docker`, `helm`, etc).

If `direnv` encounters an `.envrc` file it has not previously processed, or one that has changed since last seen,
`direnv` will prompt you to approve the processing of its content.

```
direnv: error .envrc is blocked. Run `direnv allow` to approve its content.
```

At prompts like this, if you're confident that the `.envrc` file is safe for `direnv` to process, run `direnv allow`.

- `.git`

The `.git` directory holds files that `git` uses. You will likely never need to interact directly with this directory.

- `.gitignore`

The `.gitignore` file tracks which file names `git` should ignore when doing `git add` commands.

- `LICENSE` and `README.md`

These are standard fare license and high level documentation for the framework-deploy project.

- `apps`

The `apps` directory contains template files for the [mh](https://github.com/cisco-sso/mh) command. Each "app" is a
template which produces and overrides for a particular Helm chart.

- `bin`

The `bin` directory contains scripts that simplify specific operations. For example, `bin/get-password-grafana.sh` is a
helper script that retrieves the auto-generated admin password for [grafana](https://grafana.com/) from the kubernetes
secret as installed by framework-deploy.

- `clusters`

The `clusters` directory contains a directory for each Kubernetes cluster you manage with framework-deploy. The
framework-deploy repo contains boilerplate for the `docker-for-desktop` Kubernetes cluster which was spun up earlier
in this tutorial.

In an internal and private fork of framework-deploy, you can make cluster directories for your own Kubernetes clusters
(e.g. `myorg1-dev.example.org`). Each cluster directory contains an `.envrc` (via symlink) that automatically
configures your shell environment (e.g. the `KUBECONFIG` environment variable).

In the framework-deploy pattern, Kubernetes cluster context name and KUBECONFIG filename are both set to match the
cluster's external FQDN (e.g. `myorg1-dev.example.org`). This naming convention enables framework-deploy automation to
simplify interactive cluster usage.

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

The [mh](https://github.com/cisco-sso/mh) tool which ships with the KDK container image is capable of managing one or
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

### Interact with Kubernetes using [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/).

```bash
kubectl config get-contexts
## CURRENT   NAME                 CLUSTER                      AUTHINFO             NAMESPACE
## *         docker-for-desktop   docker-for-desktop-cluster   docker-for-desktop

kubectl config current-context
## docker-for-desktop

kubectl version
## Client Version: version.Info{Major:"1", Minor:"11", GitVersion:"v1.11.1", GitCommit:"b1b29978270dc22fecc592ac55d903350454310a", GitTreeState:"clean", BuildDate:"2018-07-18T11:36:43Z", GoVersion:"go1.10.3", Compiler:"gc", Platform:"darwin/amd64"}
## Server Version: version.Info{Major:"1", Minor:"10", GitVersion:"v1.10.3", GitCommit:"2bba0127d85d5a46ab4b778548be28623b32d0b0", GitTreeState:"clean", BuildDate:"2018-05-21T09:05:37Z", GoVersion:"go1.9.3", Compiler:"gc", Platform:"linux/amd64"}

kubectl get nodes
## NAME                 STATUS    ROLES     AGE       VERSION
## docker-for-desktop   Ready     master     1h       v1.10.3

kubectl get statefulsets --all-namespaces
## No resources found.

kubectl get deployments --all-namespaces
## NAMESPACE     NAME          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
## docker        compose       1         1         1            1           21h
## docker        compose-api   1         1         1            1           21h
## kube-system   kube-dns      1         1         1            1           21h

kubectl get pod --all-namespaces
## NAMESPACE     NAME                                         READY     STATUS    RESTARTS   AGE
## docker        compose-7447646cf5-gbcrx                     1/1       Running   0          1h
## docker        compose-api-6fbc44c575-gd92f                 1/1       Running   0          1h
## kube-system   etcd-docker-for-desktop                      1/1       Running   1          1h
## kube-system   kube-apiserver-docker-for-desktop            1/1       Running   1          1h
## kube-system   kube-controller-manager-docker-for-desktop   1/1       Running   1          1h
## kube-system   kube-dns-86f4d74b45-snz5s                    3/3       Running   0          1h
## kube-system   kube-proxy-dmqvq                             1/1       Running   0          1h
## kube-system   kube-scheduler-docker-for-desktop            1/1       Running   1          1h
```

### Initialize [Helm Tiller](https://docs.helm.sh/glossary/#tiller) into your local Kubernetes cluster.

```bash
helm version
## Client: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
## Error: could not find tiller

helm init --wait
## $HELM_HOME has been configured at /home/<you>/.helm.
##
## Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.
##
## Please note: by default, Tiller is deployed with an insecure 'allow unauthenticated users' policy.
## To prevent this, run `helm init` with the --tiller-tls-verify flag.
## For more information on securing your installation see: https://docs.helm.sh/using_helm/#securing-your-helm-installation
## Happy Helming!

helm version
## Client: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
## Server: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
```

### [Simulate](https://github.com/cisco-sso/mh#simulate-app-upgrades-or-simulate-install-of-apps-as-needed) the deployment of KDF apps using mh.

```bash
mh simulate --printRendered
## ...
```

### [Apply](https://github.com/cisco-sso/mh#apply-app-upgrades-or-install-apps-as-needed) the deployment of KDF apps using mh.

```bash
mh apply
## ...
```

### Inspect the resulting Helm releases.

```bash
helm ls
## NAME                   REVISION UPDATED                  STATUS   CHART                        APP VERSION NAMESPACE
## chaoskube              1        Thu Sep 27 15:37:53 2018 DEPLOYED chaoskube-0.8.0              0.8.0       default
## elasticsearch          1        Thu Sep 27 15:37:40 2018 DEPLOYED elasticsearch-1.4.0          6.3.1       default
## elasticsearch-exporter 1        Thu Sep 27 15:37:42 2018 DEPLOYED elasticsearch-exporter-0.2.0 1.0.2       default
## filebeat               1        Thu Sep 27 15:37:47 2018 DEPLOYED filebeat-0.6.0               6.3.1       default
## grafana                1        Thu Sep 27 15:37:51 2018 DEPLOYED grafana-1.13.1               5.1.3       default
## kibana                 1        Thu Sep 27 15:37:45 2018 DEPLOYED kibana-0.8.0                 6.3.1       default
## nginx-ingress-external 1        Thu Sep 27 15:37:43 2018 DEPLOYED nginx-ingress-0.23.0         0.15.0      default
## prometheus             1        Thu Sep 27 15:37:48 2018 DEPLOYED prometheus-7.0.0             2.3.2       default
```

### Use the [watch](https://linux.die.net/man/1/watch) command to monitor the status.

(Use `CTRL + c` to exit the watch command loop.)

```bash
watch -n1 'kubectl get pod'
## Every 1.0s: kubectl get pod
##
## NAME                                                            READY     STATUS              RESTARTS   AGE
## chaoskube-chaoskube-7f5874cc98-nvksz                            0/1       ContainerCreating   0          9s
## elasticsearch-client-7cdc657767-p9kzq                           0/1       PodInitializing     0          22s
## elasticsearch-data-0                                            0/1       Init:1/2            0          22s
## elasticsearch-exporter-elasticsearch-exporter-659975bf4-b75sf   1/1       Running             0          20s
## elasticsearch-master-0                                          0/1       Init:0/2            0          22s
## filebeat-dvgd8                                                  0/1       ContainerCreating   0          15s
## grafana-599bd6c66-fqf98                                         0/1       Init:0/1            0          11s
## kibana-5f66c65c47-6nttz                                         0/1       ContainerCreating   0          17s
## nginx-ingress-external-controller-dd7775d7f-clflh               0/1       ContainerCreating   0          19s
## nginx-ingress-external-default-backend-744cd584cf-drxx9         0/1       ContainerCreating   0          19s
## prometheus-alertmanager-6bfdc4b7f4-4wtxl                        0/2       ContainerCreating   0          13s
## prometheus-kube-state-metrics-6584885ccf-l7lnz                  0/1       ContainerCreating   0          13s
## prometheus-node-exporter-zzz5b                                  0/1       ContainerCreating   0          13s
## prometheus-pushgateway-d5fdc4f5b-wjzdt                          0/1       ContainerCreating   0          13s
## prometheus-server-5c969bc49c-jm9fl                              0/2       PodInitializing     0          13s
```

### You should soon see that all pods are running and ready.

```bash
## Every 1.0s: kubectl get pod
##
## NAME                                                            READY     STATUS    RESTARTS   AGE
## chaoskube-chaoskube-7f5874cc98-nvksz                            1/1       Running   0          21m
## elasticsearch-client-7cdc657767-p9kzq                           1/1       Running   0          21m
## elasticsearch-data-0                                            1/1       Running   0          21m
## elasticsearch-exporter-elasticsearch-exporter-659975bf4-b75sf   1/1       Running   0          21m
## elasticsearch-master-0                                          1/1       Running   0          21m
## elasticsearch-master-1                                          1/1       Running   0          18m
## filebeat-dvgd8                                                  1/1       Running   0          21m
## grafana-599bd6c66-fqf98                                         1/1       Running   0          21m
## kibana-5f66c65c47-6nttz                                         1/1       Running   0          21m
## nginx-ingress-external-controller-dd7775d7f-clflh               1/1       Running   0          21m
## nginx-ingress-external-default-backend-744cd584cf-drxx9         1/1       Running   0          21m
## prometheus-alertmanager-6bfdc4b7f4-4wtxl                        2/2       Running   0          21m
## prometheus-kube-state-metrics-6584885ccf-l7lnz                  1/1       Running   0          21m
## prometheus-node-exporter-zzz5b                                  1/1       Running   0          21m
## prometheus-pushgateway-d5fdc4f5b-wjzdt                          1/1       Running   0          21m
## prometheus-server-5c969bc49c-jm9fl                              2/2       Running   0          21m
```

### Get a list of [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resources.

```bash
kubectl get ingress
## NAME                      HOSTS                                         ADDRESS     PORTS     AGE
## grafana                   grafana.docker-for-desktop.example.org        localhost   80        21m
## kibana                    kibana.docker-for-desktop.example.org         localhost   80        21m
## prometheus-alertmanager   alertmanager.docker-for-desktop.example.org   localhost   80        21m
## prometheus-pushgateway    pushgateway.docker-for-desktop.example.org    localhost   80        21m
## prometheus-server         prometheus.docker-for-desktop.example.org     localhost   80        21m
```

### HTTP GET an API behind a Kubernetes Ingress resource.

This [curl](https://curl.haxx.se/) command performs an HTTP GET against the [Prometheus API](https://prometheus.io/docs/prometheus/latest/querying/api/) which is exposed by the [nginx-ingess](https://github.com/kubernetes/ingress-nginx). Note how the host header is used for ingress routing.

```bash
curl -fsSL \
  --header 'Host: prometheus.docker-for-desktop.example.org' \
  http://host.docker.internal/api/v1/label/__name__/values \
  | jq '.status'
## "success"
```

It is also possible to visit ingress endpoints in the broswer on your host machine. However, you'll need to include
[hosts](https://en.wikipedia.org/wiki/Hosts_(file)) file lines to ensure the ingress host names resolve properly to
`127.0.0.1`. We plan to add documentation to simplify and clarify how this is done.
