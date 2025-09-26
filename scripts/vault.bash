#!/bin/bash
sops decrypt secrets/secrets.yaml | grep vault_password | awk '{print $2}'
