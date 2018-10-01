### Open up a SOCKS connection by connecting to your KDK

```
kdk ssh
```

### Install Firefox

We prefer Firefox because it allows one to manage network proxy configurations independently of the host operating
system.

Download Firefox [here](https://www.mozilla.org/en-US/firefox/new/) or install it through a prior-installed package
manager as prior steps have used.


### Configure your web browser to connect via the KDK SOCKS proxy

It may be beneficial to start Firefox with the profile manager so that you can keep these settings separate from the
default instance.  Start the profile manager by adding the `-P` option on the command line.  See this
[link](https://support.mozilla.org/en-US/kb/profile-manager-create-and-remove-firefox-profiles) for instructions.

Firefox -> `General` -> `Network Proxy` -> Click `Settings`

- In the Settings window:
  - Toggle on `Manual proxy configuration`
  - Enter SOCKS Host value "127.0.0.1"
  - Enter SOCKS Port value "8000"
  - Toggle on `SOCKS v5`
  - Toggle on `Proxy DNS when using SOCKS v5`
  - Click `Ok`

![docker-preferences-kubernetes](/images/firefox-settings-socks.png)

### Once Firefox has been started, you may access all of the admin panels

The following links will work if you have successfully setup the KDK SOCKS proxy with Firefox.

<div hidden comment>$ kubectl get ing| grep -v HOSTS| awk '{print "http://" $2}'</div>

Kibana

* http://kibana.docker-for-desktop.example.org

Grafana

* http://grafana.docker-for-desktop.example.org

Prometheus

* http://prometheus.docker-for-desktop.example.org
* http://alertmanager.docker-for-desktop.example.org
* http://pushgateway.docker-for-desktop.example.org
