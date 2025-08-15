# Cluster-Disaster-Recovery

# Reduce some work load, scale down the deployments, statefuls. And monitor system during the process

# Get the node info
kubectl get nodes --show-labels

# Get all info in the node
kubectl describe node <node-name>

# Give taint to the node
kubectl taint nodes <node-name> key=1:NoSchedule
kubectl taint nodes <node-name> key:NoSchedule-

# Check if draning will work of not 
kubectl drain <node-name> --dry-run

# Verify Pod Disruption Budgets (PDBs) 
kubectl get poddisruptionbudgets -A
kubectl describe pdb <pdb-name> -n <namespace>

# Check other resources not nacassary, just to be infromed
kubectl get clusterrole

kubectl get clusterrolebinding

kubectl get mutatingwebhookconfiguration

kubectl get ValidatingWebhookConfiguration

# Check Custom Resourses 
kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -A

# Drain the node 
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data

## If some pods are not deleting then apply force, grase by default is 30s we can set it 0 or more than 30s.
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data --force --grace-period=30

# Check status if force flag is used
kubectl get pods --field-selector spec.nodeName=<node-name> -A
kubectl get pods --all-namespaces --field-selector spec.nodeName=<node-name>

# Perform all the operation of maintainence, Like os security patch updates

# If required join the node again, if something big happends.
kubeadm join <cluster-info>

# Run uncordon to turn node back to scheduling
kubectl uncordon <node-name>
