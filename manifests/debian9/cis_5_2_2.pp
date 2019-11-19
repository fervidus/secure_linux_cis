# 5.2.2 Ensure permissions on SSH private host key files are configured (Scored)
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
# @summary 5.2.2 Ensure permissions on SSH private host key files are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_5_2_2
class secure_linux_cis::debian9::cis_5_2_2 (
  Boolean $enforced = true,
) {

  include ::secure_linux_cis::service

  if $enforced and !$facts['ssh_host_keys'].empty {

    file{ $facts['ssh_host_keys']:
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
}
