---
title: Install the KDK
weight: 10
---

The following steps are here to help you install the [Kubernetes Development Kit (KDK)](https://github.com/cisco-sso/kdk)

{{% notice note %}}
The KDK is compatible with OSX, Windows10, and Linux.  However, Linux is mostly untested.
{{% /notice %}}


## Prerequisites


{{<code-toggle title="Install Package Management System and Basic Tools for" item-default="osx" item-list="osx win10" button-class="btn">}}
<div item="osx">
{{< highlight bash >}}
# Open a Terminal
<Spotlight_Search -> Terminal>

# Install HomeBrew Package Management System for Mac
#   https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Utils
brew install git
brew cask install keybase

# Install Docker for Mac
open https://docs.docker.com/docker-for-mac/release-notes/
{{</ highlight >}}
</div>
<div item="win10">
{{< highlight bash >}}
# Open Powershell Terminal as Administrator

# Install Chocolatey Package Management System for Windows
#   https://chocolatey.org/
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install required Utils
choco.exe install -y openssh git curl sudo

# Ensure
choco.exe uninstall vagrant virtualbox

# Install Docker
start https://docs.docker.com/docker-for-windows/release-notes/

# Install Keybase
start https://keybase.io/docs/the_app/install_windows
{{</ highlight >}}
</div>
{{</ code-toggle >}}

