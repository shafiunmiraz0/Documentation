# falco
https://falco.org/docs/getting-started/falco-kubernetes-quickstart/
https://github.com/falcosecurity/charts

## Deploy Falco

### install the helm repository:
```
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
```

### Then install Falco:
```
helm install --replace falco --namespace falco --create-namespace --set tty=true falcosecurity/falco
```

### And check that the Falco pods are running
```
kubectl get pods -n falco
```

### 