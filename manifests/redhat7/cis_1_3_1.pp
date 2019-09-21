# 1.3.1 Ensure AIDE is installed (Scored)
#
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary 1.3.1 Ensure AIDE is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_3_1
class secure_linux_cis::redhat7::cis_1_3_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'aide':
      ensure => installed,
      notify => Exec['aide_database'],
    }

    exec { 'aide_database':
      command   => 'aide --init',
      creates   => '/var/lib/aide/aide.db.new.gz',
      path      => '/sbin/',
      logoutput => true,
      notify    => Exec['rename_aide_database'],
    }

    exec { 'rename_aide_database':
      command => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
      creates => '/var/lib/aide/aide.db.gz',
      path    => ['/usr/bin', '/usr/sbin',],
      logoutput => true,
    }
  }
}
