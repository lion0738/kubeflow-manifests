#!/bin/bash

NAMESPACES=("istio-system" "auth" "cert-manager" "oauth2-proxy" "kubeflow")

for NAMESPACE in "${NAMESPACES[@]}"; do
    if kubectl get namespace "$NAMESPACE" >/dev/null 2>&1; then
        echo "Patching the PSS-restricted labels for namespace $NAMESPACE..."
        kubectl patch namespace $NAMESPACE --patch-file ./experimental/security/PSS/static/restricted/patches/${NAMESPACE}-labels.yaml
    fi
done
