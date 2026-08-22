---
name: status-review
description: Review Regi0x Status monitoring changes for correctness, privacy, retention, alerting and failure behavior.
disable-model-invocation: true
---

Review the current Regi0x Status change as an operational system, not only as UI/code.

Check:

1. Every network probe has a timeout and cancellation path.
2. Failure/recovery thresholds prevent obvious flapping.
3. Monitor targets, credentials and raw internal error messages cannot reach public HTML/JSON unless explicitly safe.
4. Raw probe retention remains bounded; long uptime history uses aggregates.
5. The status process has health/readiness and graceful shutdown.
6. Alerting does not depend solely on a service hosted on the main VPS being monitored.
7. New monitor/admin inputs cannot create unrestricted SSRF.
8. Public status groups use product-facing names and do not leak infrastructure topology.
9. systemd remains the production runtime; no Docker/Python was introduced without an explicit architecture change.
10. UI follows canonical Regi0x tokens/components, EN/RU, responsive and reduced-motion requirements.
11. `task check` or the repository's canonical verification was actually run.

Return findings ordered: Critical, High, Medium, Low, then a short verification summary.
