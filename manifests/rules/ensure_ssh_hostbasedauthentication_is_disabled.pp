# @api private
#  Ensure SSH HostbasedAuthentication is disabled (Scored)
#
# Description:
# The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts , or
# /etc/hosts.equiv , along with successful public key client host authentication. This option only applies to SSH Protocol Version 2.
#
# Rationale:
# Even though the .rhosts files are ineffective if support is disabled in /etc/pam.conf , disabling the ability to use .rhosts files in SSH
# provides an additional layer of protection .
#
# @summary  Ensure SSH HostbasedAuthentication is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_hostbasedauthentication_is_disabled
class secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh host based authentication':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'HostbasedAuthentication no',
      match    => '^HostbasedAuthentication',
      notify   => Exec['reload sshd'],
    }
  }
}
