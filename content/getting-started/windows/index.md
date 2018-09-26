---
title: Getting Started > Windows
---

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
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```


## Step 2: Docker

### Install [Docker for Windows](https://docs.docker.com/docker-for-windows/release-notes/).

```bash
choco install -y docker-for-windows
```

### Reboot

{{% warning %}}
You must reboot after installing Docker For Windows, and accept all prompts (e.g. enabling Hyper-V)
{{% /warning %}}


## Step 3: Kubernetes

{{% warning %}}
TODO (use a readfile)
{{% /warning %}}


## Step 4: Keybase

{{% note %}}
{{% markdownReplace old="[[ MOUNTPOINT ]]" new="k:" %}}
{{% readfile file="/content/getting-started/readfiles/keybase-note.md" %}}
{{% /markdownReplace %}}
{{% /note %}}

### Install Keybase.

```bash
choco install -y keybase
```

### Open Keybase.

- `Windows Search` -> `keybase`

### Enable Keybase Files.

- `Settings` -> `Files` -> `Enable Keybase` in `Explorer`

### Verify that KeybaseFS is mounted to your system.

```bash
dir k:
```

{{% note %}}
Success looks like...
```bash
$ dir k:
private  public  team
```
{{% /note %}}


## Step 5: KDK

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/kdk-note.md" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/kdk-install-windows.md" markdown="true" %}}
{{% readfile file="/content/getting-started/readfiles/kdk-usage.md" markdown="true" %}}


## Step 6: Framework Deploy

{{% note %}}
{{% readfile file="/content/getting-started/readfiles/framework-deploy-note.md" markdown="true" %}}
{{% /note %}}

{{% readfile file="/content/getting-started/readfiles/framework-deploy-main.md" markdown="true" %}}


## Post-Install

{{% readfile file="/content/getting-started/readfiles/post-install.md" markdown="true" %}}
