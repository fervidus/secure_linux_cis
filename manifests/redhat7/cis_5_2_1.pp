# 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
#
# Description:
# The /etc/ssh/sshd_config file contains configuration specifications for sshd.
# The command below sets the owner and group of the file to root.
#
# Rationale:
# The /etc/ssh/sshd_config file needs to be protected from unauthorized changes
# by non-privileged users.
#
# @summary 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_1
class secure_linux_cis::redhat7::cis_5_2_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/etc/ssh/sshd_config':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
}
