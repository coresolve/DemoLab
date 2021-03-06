# Setup Tectonic Console

```shell
kubectl create namespace tectonic-system
kubectl --namespace=tectonic-system create -f https://tectonic.com/enterprise/docs/latest/deployer/files/tectonic-console.yaml
```

Install Pull Secret
``` shell
kubectl --namespace=tectonic-system create -f coreos-pull-secret.yml

```

At this point Tectonic console should be running with no authentication.

View locally via kubectl proxy
```shell
kubectl  --namespace=tectonic-system get pods -l tectonic-app=console -o template --template="{{range.items}}{{.metadata.name}}{{end}}" | xargs -I{} kubectl --namespace=tectonic-system port-forward {} 9000
```
