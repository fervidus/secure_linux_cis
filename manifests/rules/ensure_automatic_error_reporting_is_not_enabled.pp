# @api private
#
# @summary Ensure Automatic Error Reporting is not enabled
#
class secure_linux_cis::rules::ensure_automatic_error_reporting_is_not_enabled {
  file { '/etc/default/apport':
    ensure => file,
  }

  -> file_line { 'Ensure apparmor reporting is not enabled':
    ensure => present,
    path   => '/etc/default/apport',
    line   => 'enabled=0',
    match  => '^enabled',
  }

  service { 'apport':
    ensure => stopped,
    enable => false,
  }
}
