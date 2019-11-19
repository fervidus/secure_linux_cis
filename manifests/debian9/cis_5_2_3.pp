# 5.2.3 Ensure permissions on SSH public host key files are configured (Scored)
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
# @summary 5.2.3 Ensure permissions on SSH public host key files are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_5_2_3
class secure_linux_cis::debian9::cis_5_2_3 (
  Boolean $enforced = true,
) {

  include ::secure_linux_cis::service

  if $enforced and !$facts['ssh_host_pub_keys'].empty {

    file{ $facts['ssh_host_pub_keys']:
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
}
