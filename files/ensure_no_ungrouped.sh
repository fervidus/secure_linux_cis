#!/bin/bash
# Reasons to exclude:
# /var/cache/private/fwupdmgr - Ubuntu Firmware Update Manager work files
# /var/lib/docker/overlay2 - Docker work files
# /var/lib/kubelet/pods - Kubernetes work files
# /var/opt/microsoft/omsagent - Azure Linux VM cloud-init work files
EXCLUDES="^/var/cache/private/fwupdmgr|^/var/lib/docker/overlay2|^/var/lib/kubelet/pods|^/var/opt/microsoft/omsagent"
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup | egrep -v "$EXCLUDES"
