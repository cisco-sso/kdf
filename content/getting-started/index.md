---
title: Getting Started
---

*Select your Operating System:* {{<snippet-selector item-group="os" item-default="osx" item-list="osx win10" button-class="btn">}}

The kdk repository may be used to create a docker container with all of the tools that one would typically use in order to develop and operate kubernetes clusters.

The following steps are here to help you install the [Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk)

<div class="alert alert-info" role="alert">
The KDK is compatible with OSX, Windows10, and Linux.  However, Linux is mostly untested except when using the KDK to develop itself running 'docker-in-docker'.  The instructions for Linux are not yet included, but should be similar to that of OSX.
</div>

## Install Prerequisites

*Select your Operating System:* {{<snippet-selector item-group="os" item-default="osx" item-list="osx win10" button-class="btn">}}

<div item-group="os" item="win10">
<div class="alert alert-warning" role="alert">
Windows10 Only: prerequisites installation requires the usage of Powershell as the adminstrative user.
</div>
</div>


Install package management system
<div item-group="os" item="osx">
```bash
# Open a Terminal
#   Spotlight Search Command[⌘]-Space[" "] -> Terminal

# Install HomeBrew Package Management System
#   https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
</div>
<div item-group="os" item="win10">
```bash
# Open the Powershell Terminal as Administrator
#   Windows Search -> Windows PowerShell (Right click "Run as Administrator")

# Install Chocolatey Package Management System
#   https://chocolatey.org/
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
</div>

Install utils
<div item-group="os" item="osx">
```bash
# Install utils
brew install git
brew cask install keybase
```
</div>

<div item-group="os" item="win10">
```bash
# Install utils
choco.exe install -y git curl sudo keybase
```
</div>

Uninstall potentially conflicting packages (Optional)
<div item-group="os" item="osx">
```bash
# Uninstall potentially conflicting packages
brew uninstall vagrant virtualbox
```
</div>

<div item-group="os" item="win10">
```bash
# Uninstall potentially conflicting packages
choco.exe uninstall vagrant virtualbox
```
</div>


Install Docker
<div item-group="os" item="osx">
```bash
# Install Docker for Mac
open https://docs.docker.com/docker-for-mac/release-notes/
```
</div>

<div item-group="os" item="win10">
```bash
# Install Docker for Windows
start https://docs.docker.com/docker-for-windows/release-notes/
```
</div>


## Configure Prerequisites

*Select your Operating System:* {{<snippet-selector item-group="os" item-default="osx" item-list="osx win10" button-class="btn">}}

### Keybase

Keybase is optionally required to make sharing secrets with other people easier.  A user may be added to a keybase team, at which point the team's secret files are exposed under the local filesystem at <span item="osx">'/keybase'</span><span item="win10">'k:'</span>.  Scripts and automation may then locate secrets within the keybase filesystem, which is mounted at the same location on everyone's machine.  Upon `kdk init`, the KDK will prompt you to mount the host <span item="osx">'/keybase'</span><span item="win10">'k:'</span> directory within the kdk docker container at '/keybase'.


Configure Keybase
<div item-group="os" item="osx">
```bash
# Open Keybase
#   Spotlight Search Command[⌘]-Space[" "] -> keybase

# Enable Keybase Files
#   Settings -> Files -> Enable Keybase in Finder

# Verify that KeybaseFS has been mounted on your system
ls /keybase
```
</div>

<div item-group="os" item="win10">
```bash
# Open "Git Bash"
#   Windows Search -> keybase

# Enable Keybase Files
#   Settings -> Files -> Enable Keybase in Explorer

# Verify that KeybaseFS has been mounted on your system
dir k:
```
</div>

Be a good Keybase citizen, and ensure you are registered on keybase with your full name and at least one verification.  Ask your team lead to add you to any relevant keybase teams to gain access to their files under <span item="osx">'/keybase/team/\<team-name\>'</span><span item="win10">'k:/team/\<team-name\>'</span>.


## Install and Run the KDK

*Select your Operating System:* {{<snippet-selector item-group="os" item-default="osx" item-list="osx win10" button-class="btn">}}

<div item-group="os" item="win10">
<div class="alert alert-warning" role="alert">
Windows 10 Only: After prerequisites installation, all KDK operations must occur within the "Git Bash" shell, instead of the PowerShell.
</div>
</div>

<div item-group="os" item="osx">
```bash
# Open a Terminal
#   Spotlight Search Command[⌘]-Space[" "] -> Terminal
```
</div>

<div item-group="os" item="win10">
```bash
# Open "Git Bash"
#   Windows Search -> Git Bash
```
</div>


```bash
# Install the KDK
curl -sSL https://raw.githubusercontent.com/cisco-sso/kdk/master/files/install | bash

# Print out the KDK Usage
kdk

# Configure the KDK
kdk init

# Run and Connect the KDK
kdk ssh
```

At this point, running 'kdk ssh' at any	time will connect you to the KDK.


## Post Install Configuration

### Adding keys to source control

This is optional if you are using [ssh-agent](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/), which the KDK automatically forwards.  Otherwise, you may directly configure the pre-generated ssh key which is used to connect to the KDK, within each source control provider.

Add content of ssh public key `~/.kdk/ssh/id_rsa.pub`

* To your [Github Account Keys](https://github.com/settings/keys)
* To your Bitbucket Server https://<BITBUCKET-SERVER>/bitbucket/plugins/servlet/ssh/account/keys
