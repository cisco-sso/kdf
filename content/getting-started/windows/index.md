---
title: Getting Started > Windows
---

## Intro

{{% readfile file="/content/getting-started/readfiles/getting-started-intro.md_" markdown="true" %}}

## Requirements

- **Windows 10 Pro** or **Windows 10 Enterprise** is required.
- You must execute all PowerShell commands as an administrative user.
- 8 GB RAM
- 2 CPU cores
- BIOS Settings with Hardware Virtualization Enabled (VTx and VT-d)


## Step 1: Chocolatey

### Open a Powershell terminal as `Administrator`.

- `Windows Search` -> `Windows PowerShell` -> right click `Run as Administrator`

### Install [Chocolatey](https://chocolatey.org/install).

```bash
# Windows Powershell as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```


## Step 2: Docker

### Install [Docker for Windows](https://docs.docker.com/docker-for-windows/release-notes/).

```bash
# Windows Powershell as Administrator
choco install -y docker-for-windows
```

- *If* at any point during these instructions you receive an undocumented
  prompt of Docker requesting elevated permissions, please select the
  *Affirmative* answer.

### Start Docker.

- Windows Search -> `Docker For Windows` -> ( `Enter`)

![docker-startmenu](/images/windows/docker-startmenu.png)

- *If* you receive a prompt to enable Hyper-V, then enable it by clicking `Ok`.
  This will restart your computer, at which point you will have to start Docker
  for Windows again by following the prior step.

![docker-hyperv](/images/windows/docker-hyperv.png)

- The Docker icon should now be displayed in the taskbar tray.

- Open the Docker menu by right clicking the Docker icon and selecting `Settings`.

![docker-tray-icon-settings](/images/windows/docker-tray-icon-settings.png)

- On the `General` tab:
  - Toggle on `Start Docker when you log in`
  - Toggle on `Automatically check for updates`

![docker-settings-general](/images/windows/docker-settings-general.png)

- After a minute or two, you should see `Docker is running` with a green circle.


## Step 3: Kubernetes

- Ensure Docker is running by completing [Step 2: Docker](#step-2-docker) above.

- Open the Docker menu by right clicking the Docker icon in the taskbar tray and selecting `Settings`.

![docker-tray-icon-settings](/images/windows/docker-tray-icon-settings.png)

- On the `Advanced` tab:
  - Set CPUs: 2
  - Set Memory: 4.0GiB
  - Set Swap: 512MiB
  - Click `Apply`

![docker-settings-kubernetes](/images/windows/docker-settings-advanced.png)

- On the `Kubernetes` tab:
  - Toggle on `Enable Kubernetes`.
  - Click the `Kubernetes` radio button under `Default orchestrator for "docker stack" commands`.
  - Toggle on `Show system containers (advanced)`.
  - Click `Apply`.

![docker-settings-kubernetes](/images/windows/docker-settings-kubernetes.png)

- When prompted with "Kubernetes cluster installation", accept by clicking `Install`

![docker-kubernetes-install-dialog](/images/windows/docker-kubernetes-install-dialog.png)

- Wait for the "Installation Complete!" dialog, and click `Close`

![docker-kubernetes-install-complete](/images/windows/docker-kubernetes-install-complete.png)

- Once Kubernetes is ready, you will see `Kubernetes is running`.


{{% note %}}
We'll explore Kubernetes more later in this guide from inside of a
[Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk) container.
{{% /note %}}


## Step 4: Keybase

{{% note %}}
{{% markdownReplace old="[[ MOUNTPOINT ]]" new="k:" %}}
{{% readfile file="/content/getting-started/readfiles/keybase-note.md_" %}}
{{% /markdownReplace %}}
{{% /note %}}

### Install Keybase.

```bash
# Windows Powershell as Administrator
choco install -y keybase
```

### Open Keybase.

- `Windows Search` -> `keybase`
- Login using your [keybase.io](https://keybase.io/) credentials and authorize the client.

### Enable Keybase Files.

- `Settings` -> `Files` -> `Enable Keybase in Explorer`

### Verify that KeybaseFS is mounted to your system.

```bash
# Windows Powershell
dir k:
## private  public  team
```


## Step 5: KDK

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/kdk-note.md_" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/kdk-install-windows.md_" markdown="true" %}}
{{% readfile file="/content/getting-started/readfiles/kdk-usage.md_" markdown="true" %}}


## Step 6: Framework Deploy

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/framework-deploy-note.md_" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/framework-deploy-main.md_" markdown="true" %}}


## Step 7: Explore Kubernetes

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/explore-kubernetes-note.md_" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/explore-kubernetes-main.md_" markdown="true" %}}


## Post-Install

{{% readfile file="/content/getting-started/readfiles/post-install.md_" markdown="true" %}}


## Uninstall & Cleanup

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/uninstall-cleanup-note.md_" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/uninstall-cleanup-main.md_" markdown="true" %}}

### Uninstall Docker for Windows

- Open "Add Or Remove Programs" through the Windows start menu search:
![windows-start-add-or-remove-programs](/images/windows/windows-start-add-or-remove-programs.png)

- In the "Apps & Features" Search box:
  - Enter: `docker`
  - Click `Uninstall`

![windows-add-or-remove-programs-docker](/images/windows/windows-add-or-remove-programs-docker.png)


### Delete leftover Docker and Kubernetes state

```
# Windows Powershell on Host machine
del -r ~/.docker ~/.kube
```
