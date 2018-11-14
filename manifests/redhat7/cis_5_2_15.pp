# 5.2.15 Ensure SSH warning banner is configured (Scored)
#
# Description:
# The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no
# banner is displayed.
#
# Rationale:
# Banners are used to warn connecting users of the particular site's policy regarding connection. Presenting a warning message prior to the
# normal user login may assist the prosecution of trespassers on the computer system.
#
# @summary 5.2.15 Ensure SSH warning banner is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_15
class secure_linux_cis::redhat7::cis_5_2_15 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh warning banner':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => 'Banner /etc/issue.net',
        match  => '^#?Banner',
    }
  }
}
