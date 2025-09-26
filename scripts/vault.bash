#!/bin/bash
# Function to check script arguments for --vault-password-file
vault_file_arg() {
    for arg in "$@"; do
        if [[ "$arg" == --vault-password-file=* ]]; then
            echo "${arg#--vault-password-file=}"
            return
        fi
        # Support split option style: --vault-password-file FILE
        if [[ "$arg" == --vault-password-file ]]; then
            next_is_file=true
        elif [[ "$next_is_file" == true ]]; then
            echo "$arg"
            return
        fi
    done
}
sops decrypt secrets/secrets.yaml | grep vault_password | awk '{print $2}'
