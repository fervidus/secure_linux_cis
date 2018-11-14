# 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)
#
# Description:
# The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts , or
# /etc/hosts.equiv , along with successful public key client host authentication. This option only applies to SSH Protocol Version 2.
#
# Rationale:
# Even though the .rhosts files are ineffective if support is disabled in /etc/pam.conf , disabling the ability to use .rhosts files in SSH
# provides an additional layer of protection .
#
# @summary 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_7
class secure_linux_cis::redhat7::cis_5_2_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh host based authentication':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => 'HostbasedAuthentication no',
        match  => '^HostbasedAuthentication',
    }
  }
}
