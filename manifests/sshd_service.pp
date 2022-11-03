# @api private
# Helper class for reloading various services when needed
#
# @example
#   include secure_linux_cis::redhat7
class secure_linux_cis::sshd_service {
  # ## Shared resources used in more than one class
  # # Set default path for execs
  # Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/' }

  # # Reload sshd config (only if running)
  # exec { 'reload sshd':
  #   command     => 'systemctl reload sshd',
  #   onlyif      => 'systemctl status sshd | grep running',
  #   refreshonly => true,
  # }

  service { 'sshd':
    ensure => running,
    enable => true,
  }
}
