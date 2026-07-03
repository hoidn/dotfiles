#!/usr/bin/env bash
set -euo pipefail

server_script="startup_server.sh"
proxy_script="startup_proxy.sh"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

reverse_lines="$(grep 'autossh .* -R ' "$server_script" || true)"

if grep -Eq -- '-R \$\{proxy_ip\}:' <<<"$reverse_lines"; then
  fail "remote forwards must bind on the proxy host, not the router public IP"
fi

if ! grep -Eq -- '-R 0\.0\.0\.0:2222:localhost:22' <<<"$reverse_lines"; then
  fail "ssh reverse tunnel must expose port 2222 on the proxy host"
fi

monitor_ports="$(
  grep -Eo -- 'autossh[[:space:]]+-M[[:space:]]+[0-9]+' "$server_script" |
    awk '{ print $3 }'
)"
duplicate_monitor_ports="$(
  sort <<<"$monitor_ports" | uniq -d
)"

if [[ -n "$duplicate_monitor_ports" ]]; then
  fail "autossh monitor ports must be unique; duplicates: $duplicate_monitor_ports"
fi

active_socat_lines="$(grep -E '^[[:space:]]*tmux send-keys .*socat TCP-LISTEN:' "$proxy_script" || true)"

if grep -Eq 'TCP-LISTEN:([0-9]+),fork TCP:localhost:\1' <<<"$active_socat_lines"; then
  fail "active socat listeners must not forward to the same port they listen on"
fi

if ! grep -Eq 'TCP-LISTEN:8893,fork TCP:localhost:8890' <<<"$active_socat_lines"; then
  fail "port 8893 should forward to the reverse tunnel on localhost:8890"
fi

printf 'startup tunnel scripts look valid\n'
