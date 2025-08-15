# 🏗️ Self-Hosted Kubernetes Lab Architecture

This README describes the architecture shown in the provided diagram for a **self-hosted Kubernetes cluster** running **Java, Python, and PHP** microservices with enhanced networking, security, observability, and disaster recovery capabilities.

---

## 🖥️ High-Level Architecture

### Nodes
- **Master Node**
  - `containerd` as container runtime
  - **Cilium** for CNI (eBPF-powered networking & security)
  - **CoreDNS** for internal DNS resolution
  - **MetalLB** for bare-metal LoadBalancer IPs
  - **cert-manager** for automatic TLS certificate management

- **Worker Nodes**
  - `containerd` runtime
  - **Cilium** for networking
  - Applications, ingress, and service mesh workloads run here

---

## 📦 Core Components (In-Cluster)

| Component       | Purpose |
|----------------|---------|
| **Kong**       | Ingress gateway, API gateway, rate limiting, authentication |
| **Istio**      | Service mesh, traffic routing, mTLS between services |
| **Keycloak**   | Identity and access management |
| **Vault**      | Secrets management |
| **Kyverno**    | Kubernetes policy enforcement |
| **Falco**      | Runtime security monitoring |
| **Litmus**     | Chaos engineering for resilience testing |
| **Hubble**     | Cilium observability |
| **Trivy**      | Container vulnerability scanning |
| **Prometheus** | Metrics collection |
| **OpenTelemetry** | Distributed tracing |
| **KEDA**       | Event-driven autoscaling |
| **Vitess**     | Horizontal database scaling for MySQL/PostgreSQL |
| **Backstage**  | Developer portal for services |
| **PostgreSQL** | Primary application database |
| **gRPC**       | Service-to-service high-performance communication |

---

## 📂 Storage & Backup

- **Rook Ceph** — Distributed block, file, and object storage for workloads
- **Velero** — Backup and disaster recovery for Kubernetes resources and PVs

---

## 🚀 Deployment Order

1. **Base Kubernetes Cluster**
   - Install `containerd`
   - Install **Cilium** CNI
   - Deploy **CoreDNS** and **MetalLB**
   - Deploy **cert-manager**

2. **Security & Policy**
   - Deploy **Kyverno**
   - Deploy **Vault**
   - Deploy **Keycloak**
   - Deploy **Falco**
   - Deploy **Trivy**

3. **Networking & Gateway**
   - Deploy **Kong** ingress gateway
   - Deploy **Istio** service mesh
   - Enable **Hubble** observability

4. **Application Platform**
   - Deploy **Prometheus** and **OpenTelemetry**
   - Deploy **KEDA** for autoscaling
   - Deploy **Vitess** for database scalability
   - Deploy **Backstage**

5. **Application Workloads**
   - Deploy Java, Python, PHP microservices
   - Configure gRPC services
   - Deploy PostgreSQL

6. **Storage & Backup**
   - Deploy **Rook Ceph**
   - Deploy **Velero** with storage backend

7. **Resilience Testing**
   - Deploy **Litmus** for chaos engineering

---

## 🔐 Security Checklist

- [x] mTLS enabled via Istio for all service-to-service traffic
- [x] Vault for all secrets (disable plain text `Secret` usage)
- [x] Kyverno enforcing:
  - Non-root containers
  - Image registry restrictions
  - Resource requests/limits
- [x] Falco alerts integrated with monitoring
- [x] Trivy image scans on CI/CD
- [x] Cloudflare/Firewall rules (if internet exposed) to whitelist known IPs
- [x] Regular Velero backups tested for restore
- [x] NetworkPolicies to limit pod communication
- [x] RBAC restricted by namespace and role
- [x] Audit logs enabled

---

## 📊 Observability Stack

- **Prometheus** → Metrics
- **Grafana** (optional) → Visualization
- **Hubble** → Network flows
- **OpenTelemetry** → Distributed traces
- **Falco** → Security events

---

## 📚 References

- [Cilium](https://cilium.io/)
- [Kong Ingress Controller](https://docs.konghq.com/kubernetes-ingress-controller/)
- [Istio Service Mesh](https://istio.io/)
- [Rook Ceph](https://rook.io/)
- [Velero](https://velero.io/)
- [Kyverno](https://kyverno.io/)
- [Litmus Chaos](https://litmuschaos.io/)

---
