# 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)
#
# Description:
# The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or
# HostbasedAuthentication.
#
# Rationale:
# Setting this parameter forces users to enter a password when authenticating with ssh.
#
# @summary 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_6
class secure_linux_cis::redhat7::cis_5_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh ignore rhosts':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => 'IgnoreRhosts yes',
      match  => '^#?IgnoreRhosts',
    }
  }
}
