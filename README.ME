# 🌐 Kubernetes Network Architecture for Secure High-Traffic Applications

This architecture is designed for **high-volume Java and PHP Laravel applications** running on Kubernetes, exposed securely to the internet through **Cloudflare Free Plan** and other open-source CNCF tools.

---

## 📋 Component Deployment Order

1. **Cloudflare DNS & SSL**
   - Configure Cloudflare Free Plan
   - Set `Proxy` mode (orange cloud) for all public subdomains
   - Enable "Full (Strict)" SSL mode
   - Add Firewall Rules (Block non-CF IPs to origin)

2. **Ingress Controller (Kong Ingress)**
   - Deploy Kong Ingress Controller via Helm
   - Enable mTLS between Kong and services
   - Configure `rate-limiting` & `IP whitelist` plugins

3. **Web Application Firewall (ModSecurity)**
   - Deploy ModSecurity WAF in sidecar mode or integrate with Kong
   - Enable OWASP CRS

4. **Service Mesh (Cilium + Hubble)**
   - Deploy Cilium with eBPF networking
   - Enable NetworkPolicies to restrict pod-to-pod traffic
   - Hubble for observability of network flows

5. **TLS Certificates (cert-manager)**
   - Deploy cert-manager
   - Use Cloudflare DNS01 challenge for wildcard SSL

6. **Applications**
   - Deploy Java & PHP Laravel apps with separate namespaces
   - Use HorizontalPodAutoscaler for scaling

7. **Monitoring & Logging**
   - Deploy Prometheus & Grafana for metrics
   - Deploy Loki & Promtail for logs

8. **Backup & Disaster Recovery**
   - Deploy Velero with S3-compatible storage
   - Schedule daily backups for persistent volumes

---

## ⚙️ Config Snippets

### 🔒 Cloudflare IP Whitelisting (Kong)
```yaml
plugins:
- name: ip-restriction
  config:
    whitelist:
      - 173.245.48.0/20
      - 103.21.244.0/22
