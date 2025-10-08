#!/bin/bash

GH_USER=${GH_USER:-julianostroschon}
GH_TOKEN=${GH_TOKEN:?Defina GH_TOKEN no ambiente (ex: export GH_TOKEN=...)}

# Gera o JSON do docker config
cat <<EOF > /tmp/dockerconfig.json
{
  "auths": {
    "ghcr.io": {
      "username": "$GH_USER",
      "password": "$GH_TOKEN",
      "auth": "$(echo -n "$GH_USER:$GH_TOKEN" | base64)"
    }
  }
}
EOF

echo -e "\n🔐 dockerconfigjson (base64):"
# Compatível com Linux e macOS
cat /tmp/dockerconfig.json | base64 | tr -d '\n'
echo