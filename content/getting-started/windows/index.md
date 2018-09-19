---
title: Getting Started > Windows
---

## Requirements

- **Windows 10 Pro** or **Windows 10 Enterprise** is required.
- You must execute all PowerShell commands as an administrative user.
- 8 GB RAM
- 2 CPU cores


## Step 1: Chocolatey

### Open a Powershell terminal as `Administrator`.

- `Windows Search` -> `Windows PowerShell` -> right click `Run as Administrator`

### Install [Chocolatey](https://chocolatey.org/install).

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Step 2: Utilities

### Install `git`, `curl` and `sudo`.

```bash
choco install -y git curl sudo
```

### Open `Git Bash`

- `Windows Search` -> `Git Bash`

## Step 3: Docker

### Install [Docker for Windows](https://docs.docker.com/docker-for-windows/release-notes/).

```bash
choco install -y docker-for-windows
```

### Reboot

{{% warning %}}
You must reboot after installing Docker on Windows.
{{% /warning %}}


## Step 4: Kubernetes

{{% warning %}}
TODO (use a readfile)
{{% /warning %}}


## Step 5: Keybase

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

```
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

{{% readfile file="/content/getting-started/readfiles/kdk-install.md" markdown="true" %}}

## Post-Install

{{% readfile file="/content/getting-started/readfiles/post-install.md" markdown="true" %}}
