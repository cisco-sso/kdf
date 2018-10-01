### Open up a SOCKS connection by connecting to your KDK

```
kdk ssh
```

### Install Firefox

We prefer Firefox because it allows one to manage network proxy configurations independently of the host operating
system.

Download Firefox [here](https://www.mozilla.org/en-US/firefox/new/) or install
it through a prior-installed package manager.


### Configure your web browser to connect via the KDK SOCKS proxy



### Get your docker-for-desktop `~/kube/config` into the KDK

TODO(jmdots): Fill in this section

```
kdk kubesync
```

### 

```
cd framework-deploy/clusters/docker-for-desktop

```

/Applications/Firefox.app/Contents/MacOS/firefox-bin -P

firefox.exe -P


<div hidden comment>$ kubectl get ing| grep -v HOSTS| awk '{print "http://" $2}'</div>
* http://grafana.docker-for-desktop.example.org
* http://kibana.docker-for-desktop.example.org
* http://alertmanager.docker-for-desktop.example.org
* http://pushgateway.docker-for-desktop.example.org
* http://prometheus.docker-for-desktop.example.org

