#!/usr/bin/env bash
set -u
fail=0
warn=0
ok(){ printf 'OK   %s\n' "$*"; }
warning(){ printf 'WARN %s\n' "$*"; warn=$((warn+1)); }
error(){ printf 'ERR  %s\n' "$*"; fail=$((fail+1)); }

printf 'Regi0x Claude Kit doctor\n\n'
command -v git >/dev/null 2>&1 && ok "git $(git --version | awk '{print $3}')" || error 'git is not installed'
command -v claude >/dev/null 2>&1 && ok 'Claude Code detected' || warning 'Claude Code CLI not found in PATH'
command -v bash >/dev/null 2>&1 && ok 'bash detected' || error 'bash not found (use PowerShell/manual install on Windows)'

[ -f CLAUDE.md ] && ok 'root CLAUDE.md exists' || warning 'root CLAUDE.md missing'
[ -d .claude/rules ] && ok '.claude/rules exists' || warning '.claude/rules missing'
[ -d .claude/skills ] && ok '.claude/skills exists' || warning '.claude/skills missing'
[ -f docs/design-system/REGI0X_DESIGN_SYSTEM_v3.md ] && ok 'Design System v3 installed' || warning 'Design System v3 not found'
[ -f docs/engineering/examples/config/fidonyaa.env.example ] && ok 'engineering examples installed' || warning 'engineering examples not found'
[ -f .claude/skills/authorization-audit/SKILL.md ] && ok 'authorization audit skill installed' || warning 'authorization audit skill missing'
[ -f .claude/skills/ui-review/SKILL.md ] && ok 'UI review skill installed' || warning 'UI review skill missing'
[ -f .claude/skills/feature/SKILL.md ] && ok 'feature workflow skill installed' || warning 'feature workflow skill missing'
[ -f .claude/rules/regi0x-localization.md ] && ok 'localization rule installed' || warning 'localization rule missing'
[ -f .claude/rules/regi0x-motion.md ] && ok 'motion rule installed' || warning 'motion rule missing'
[ -x .claude/scripts/translations-check.sh ] && ok 'translation catalog checker installed' || warning 'translation catalog checker missing/not executable'
[ -x .claude/scripts/pseudo-locale.sh ] && ok 'pseudo-locale helper installed' || warning 'pseudo-locale helper missing/not executable'
[ -x .claude/scripts/start-remote-control.sh ] && ok 'Remote Control helper installed' || warning 'Remote Control helper missing/not executable'
[ -x .claude/scripts/stack-versions.sh ] && ok 'stack version script executable' || warning 'stack version script missing/not executable'
if [ -f .claude/regi0x/profile ]; then
  profile="$(tr -d '\r\n' < .claude/regi0x/profile)"
  ok "project profile: $profile"
  if [ "$profile" != generic ]; then
    [ -f .claude/regi0x/CLAUDE.profile.md ] && ok 'profile contract installed' || warning 'profile selected but CLAUDE.profile.md missing'
  fi
else
  warning 'project profile marker missing (older/manual installation?)'
fi

if command -v claude >/dev/null 2>&1; then
  claude doctor >/dev/null 2>&1 && ok 'claude doctor passed' || warning 'claude doctor reported an issue; run it directly for details'
fi

printf '\nStack snapshot:\n'
if [ -f .claude/scripts/stack-versions.sh ]; then bash .claude/scripts/stack-versions.sh; fi
printf '\nResult: %d error(s), %d warning(s)\n' "$fail" "$warn"
[ "$fail" -eq 0 ]
