# @api private
#  Ensure SSH IgnoreRhosts is enabled (Scored)
#
# Description:
# The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or
# HostbasedAuthentication.
#
# Rationale:
# Setting this parameter forces users to enter a password when authenticating with ssh.
#
# @summary  Ensure SSH IgnoreRhosts is enabled (Scored)
#
class secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh ignore rhosts':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'IgnoreRhosts yes',
    match  => '^#?IgnoreRhosts',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
