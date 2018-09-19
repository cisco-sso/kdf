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

- Install [Docker for Mac](https://docs.docker.com/docker-for-mac/release-notes/).

```bash
brew cask install docker
```


## Step 3: Kubernetes

{{% warning %}}
TODO (use a readfile)
{{% /warning %}}


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

### Enable Keybase Files.

- `Settings` -> `Files` -> `Enable Keybase` in `Finder`

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

{{% readfile file="/content/getting-started/readfiles/kdk-install.md" markdown="true" %}}

## Post-Install

{{% readfile file="/content/getting-started/readfiles/post-install.md" markdown="true" %}}
