---
name: authorization-audit
description: Review permission, role, scope and admin-UI changes for FidonyAa authorization invariants and privilege escalation risks.
context: fork
agent: general-purpose
background: false
disable-model-invocation: true
---
# FidonyAa authorization audit

Audit target: $ARGUMENTS

Do not edit files. Read the installed project profile and relevant authorization rule/guide.

Check:
1. backend checks permission + resource scope, not UI role display name;
2. default deny and server-side checks for every privileged mutation/read;
3. custom roles do not require code branches;
4. owner/ownership cannot be reassigned through ordinary role editing;
5. actors cannot grant permissions/roles above their grant authority;
6. temporary grants expire correctly;
7. permission/session revocation/versioning takes effect promptly;
8. service identities use least privilege;
9. Minecraft profile/server-files/launcher boundaries remain distinct;
10. TTS/Bots/Admin permissions are granular rather than broad `admin` gates;
11. UI visibility is permission-aware but is not treated as security;
12. sensitive grants/denials/changes are audited without secrets;
13. EN/RU display labels do not affect stable backend keys.

Return findings ordered by severity with evidence, impact and smallest robust fix. End with `Authorization invariants preserved` or a concise list of violated invariants.
