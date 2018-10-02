
### Delete all Kubernetes Resources

This will delete all running pods and persistent volume state

```bash
# From within the KDK: `kdk ssh`
cd framework-deploy/clusters/docker-for-desktop.example.org
## direnv: error .envrc is blocked. Run `direnv allow` to approve its content.
direnv allow
## ...

helm delete --purge $(helm ls| cut -d ' ' -f 1| grep -v NAME)
## release "chaoskube" deleted
## release "elasticsearch" deleted
## release "elasticsearch-exporter" deleted
## release "filebeat" deleted
## release "grafana" deleted
## release "kibana" deleted
## release "nginx-ingress-external" deleted
## release "prometheus" deleted
## // A shortcut command `mh destroy` is equivalent to the above

kubectl delete pvc $(kubectl get pvc| cut -d ' ' -f 1| grep -v NAME)
## persistentvolumeclaim "data-elasticsearch-data-0" deleted
## persistentvolumeclaim "data-elasticsearch-master-0" deleted
## persistentvolumeclaim "data-elasticsearch-master-1" deleted
## persistentvolumeclaim "data-test-mariadb-mariadb-master-0" deleted
## persistentvolumeclaim "data-test-mariadb-mariadb-slave-0" deleted
```

