---
title: Getting Started > Mac
---

## Requirements

- **macOS High Sierra (10.13) or later** is required.
- You must execute all commands as an administrative (sudo-allowed) user.
- 8 GB RAM
- 2 CPU cores


## Step 1: Homebrew

### Open a Terminal.

- Spotlight Search ( `Command[⌘] + Space[" "]` ) -> `Terminal`

### Install [Homebrew](https://brew.sh/).

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


## Step 2: Docker

### Install [Docker for Mac](https://docs.docker.com/docker-for-mac/release-notes/).

```bash
brew cask install docker
```

### Start Docker.

- Spotlight Search ( `Command[⌘] + Space[" "]` ) -> `Docker` -> ( `Enter`)

![docker-spotlight](/images/docker-spotlight.png)

- At the `Are you sure you want to open it?` prompt, click `Open`.

![docker-open](/images/docker-open.png)

- At the `Docker needs privileged access.` prompt, click `OK`.

![docker-privileged-access](/images/docker-privileged-access.png)

- At the `Docker wants to make changes.` prompt, fill in your administrative user credentials and click `OK`.

![docker-make-changes](/images/docker-make-changes.png)

- Docker should now be running in the taskbar tray.

- Open the Docker menu by clicking: ![docker-tray-icon](/images/docker-tray-icon.png)

- After a minute or two, you should see `Docker is running` with a green circle.

![docker-tray-menu](/images/docker-tray-menu.png)

- Once you see the above, Docker is ready to use.


## Step 3: Kubernetes

- Ensure Docker is running by completing [Step 2: Docker](#step-2-docker) above.

- Open the Docker menu by clicking: ![docker-tray-icon](/images/docker-tray-icon.png)

- Open Docker Preferences.

![docker-tray-menu-preferences](/images/docker-tray-menu-preferences.png)

- On the `Advanced` tab:
  - Set CPUs: 2
  - Set Memory: 4.0GiB
  - Set Swap: 512MiB
  - Click `Apply & Restart`

![docker-preferences-kubernetes](/images/docker-preferences-advanced.png)

- On the `Kubernetes` tab:
  - Toggle on `Enable Kubernetes`.
  - Click the `Kubernetes` radio button under `Default orchestrator for "docker stack" commands`.
  - Toggle on `Show system containers (advanced)`.
  - Click `Apply`.

![docker-preferences-kubernetes](/images/docker-preferences-kubernetes.png)

- For what may become several minutes, you will see `Kubernetes is starting...` with an amber circle.

![docker-preferences-kubernetes-starting](/images/docker-preferences-kubernetes-starting.png)

- Once Kubernetes is ready, you will see `Kubernetes is running`.

![docker-preferences-kubernetes-running](/images/docker-preferences-kubernetes-running.png)

{{% note %}}
We'll explore Kubernetes more later in this guide from inside of a
[Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk) container.
{{% /note %}}


## Step 4: Keybase

{{% note %}}
{{% markdownReplace old="[[ MOUNTPOINT ]]" new="/keybase" %}}
{{% readfile file="/content/getting-started/readfiles/keybase-note.md" %}}
{{% /markdownReplace %}}
{{% /note %}}

### Install Keybase.

```bash
brew cask install keybase
```

### Open Keybase.

- Spotlight Search ( `Command[⌘] + Space[" "]` ) -> `keybase`
- Login using your [keybase.io](https://keybase.io/) credentials and authorize the client.

### Enable Keybase Files.

- `Settings` -> `Files` -> `Enable Keybase in Finder`

### Verify that KeybaseFS is mounted to your system.

```bash
ls /keybase
```

{{% note %}}
Success looks like...
```bash
$ ls /keybase
private  public  team
```
{{% /note %}}


## Step 5: KDK

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/kdk-note.md" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/kdk-install-maclinux.md" markdown="true" %}}
{{% readfile file="/content/getting-started/readfiles/kdk-usage.md" markdown="true" %}}


## Step 6: Framework Deploy

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/framework-deploy-note.md" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/framework-deploy-main.md" markdown="true" %}}


## Post-Install

{{% readfile file="/content/getting-started/readfiles/post-install.md" markdown="true" %}}
