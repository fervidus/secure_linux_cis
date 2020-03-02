# @api private
# Ensure permissions on SSH public host key files are configured (Scored)
#
# Description:
# An SSH public key is one of two files used in SSH public key authentication. In this
# authentication method, a public key is a key that can be used for verifying digital signatures
# generated using a corresponding private key. Only a public key that corresponds to a
# private key will be able to authenticate successfully.
#
# Rationale:
# If a public host key file is modified by an unauthorized user, the SSH service may be
# compromised.
#
# @summary Ensure permissions on SSH public host key files are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured
class secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    unless $facts['ssh_host_pub_keys'].empty {
      file{ $facts['ssh_host_pub_keys']:
        ensure   => 'present',
        schedule => 'harden_schedule',
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
      }
    }
  }
}
