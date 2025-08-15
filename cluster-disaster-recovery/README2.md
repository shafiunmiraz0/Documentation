# forcefully

# To forcefully delete a Kubernetes namespace, especially when it gets stuck in the `Terminating` state, you can follow these steps:


#Namespaces might get stuck due to finalizers that prevent deletion. You can edit the namespace and manually remove the finalizers.

#### a. Get the Namespace json:

kubectl get namespace <namespace_name> -o json > ns.json


#### b. Edit the `ns.json` to Remove Finalizers:

# Open the `ns.json` file in a text editor and look for the section with `finalizers`. It will look something like this:

"spec": {
  "finalizers": [
    "kubernetes"
  ]
}

# Remove the entire `finalizers` block, so it looks like this:

"spec": {}


#### c. Apply the Updated Namespace:

kubectl replace --raw "/api/v1/namespaces/<namespace_name>/finalize" -f ./ns.json


# This should force the namespace to delete, even if it was stuck due to finalizers.
#After this, the namespace should be deleted successfully.



# forcefully 2
## Locate etcd config
/etc/kubernetes/manifests/etcd.yaml

# Key Info from the File:
# Ports (2379 and 2380) for etcd.
# Certificates (--cert-file, --key-file, --trusted-ca-file).

## Install etcdctl 

wget https://github.com/etcd-io/etcd/releases/download/v3.5.12/etcd-v3.5.12-linux-amd64.tar.gz
tar -xvf etcd-v3.5.12-linux-amd64.tar.gz
sudo mv etcd-v3.5.12-linux-amd64/etcdctl /usr/local/bin/

# Verify installation and check version

# Export the crt and key
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key

# connect to etcd
etcdctl --endpoints=https://127.0.0.1:2379 member list

# List all ns
etcdctl --endpoints=https://127.0.0.1:2379 get /registry/namespaces/ --prefix --keys-only

# Delete the ns

etcdctl --endpoints=https://127.0.0.1:2379 del /registry/namespaces/<namespace>

#######



