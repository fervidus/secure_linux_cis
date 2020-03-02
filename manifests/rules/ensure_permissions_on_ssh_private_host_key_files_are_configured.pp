# @api private
# Ensure permissions on SSH private host key files are configured (Scored)
#
# Description:
# An SSH private key is one of two files used in SSH public key authentication. In this
# authentication method, The possession of the private key is proof of identity. Only a private
# key that corresponds to a public key will be able to authenticate successfully. The private
# keys need to be stored and handled carefully, and no copies of the private key should be
# distributed.
#
# Rationale:
# If an unauthorized user obtains the private SSH host key file, the host could be
# impersonated
#
# @summary Ensure permissions on SSH private host key files are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured
class secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    unless $facts['ssh_host_keys'].empty {
      file{ $facts['ssh_host_keys']:
        ensure   => 'present',
        schedule => 'harden_schedule',
        owner    => 'root',
        group    => 'root',
        mode     => '0600',
      }
    }
  }
}
