# Dragonfly-Helm



```
helm repo add dragonfly https://dragonflyoss.github.io/helm-charts/
```

```
helm install --wait --timeout 10m --create-namespace --namespace dragonfly-system dragonfly dragonfly/dragonfly -f charts-config.yaml
```

Also needs to create PVCs Example:

```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  finalizers:
  - kubernetes.io/pv-protection
  name: redis-data-dragonfly-redis-replicas-pv-2
spec:
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 8Gi
  claimRef:
    apiVersion: v1
    kind: PersistentVolumeClaim
    name: redis-data-dragonfly-redis-replicas-2
    namespace: dragonfly-system
  nfs:
    server: 10.10.200.200
    path: /var/k8s/dragonfly-system/redis-data-dragonfly-redis-replicas-2

  persistentVolumeReclaimPolicy: Retain
  volumeMode: Filesystem

---

apiVersion: v1
kind: PersistentVolume
metadata:
  finalizers:
  - kubernetes.io/pv-protection
  name: storage-dragonfly-seed-client-pv-2
spec:
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 50Gi
  claimRef:
    apiVersion: v1
    kind: PersistentVolumeClaim
    name: storage-dragonfly-seed-client-2
    namespace: dragonfly-system
  nfs:
    server: 10.10.200.200
    path: /var/k8s/dragonfly-system/storage-dragonfly-seed-client-2

  persistentVolumeReclaimPolicy: Retain
  volumeMode: Filesystem
EOF

```

```
user: root
pass: clM4cGpnaTczVw==
```