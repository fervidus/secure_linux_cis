# @api private
#  Ensure NFS and RPC are not enabled (Scored)
#
# Description:
# The Network File System (NFS) is one of the first and most widely distributed file systems in the UNIX environment.
# It provides the ability for systems to mount file systems of other servers through the network.
#
# Rationale:
# If the system does not export NFS shares or act as an NFS client,
# it is recommended that these services be disabled to reduce remote attack surface.
#
# @summary  Ensure NFS and RPC are not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nfs_and_rpc_are_not_enabled
class secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    $nfs_services = [
      'nfs',
      'nfs-server',
      'rpcbind',
    ]
    service { $nfs_services:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
