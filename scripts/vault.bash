#!/bin/bash
which sops >/dev/null 2>&1 || exit 0
sops decrypt secrets/secrets.yaml | grep vault_password | awk '{print $2}'
