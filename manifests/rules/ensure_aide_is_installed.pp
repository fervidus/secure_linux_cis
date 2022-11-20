# @api private
#  Ensure AIDE is installed (Scored)
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary  Ensure AIDE is installed (Scored)
#
class secure_linux_cis::rules::ensure_aide_is_installed {
  package { 'aide':
    ensure => installed,
    notify => Exec['create_aide_database'],
  }
  case $facts['os']['family'] {
    'RedHat': {
      exec { 'create_aide_database':
        command   => 'aide --init',
        creates   => ['/var/lib/aide/aide.db.new.gz', '/var/lib/aide/aide.db.gz'],
        path      => '/sbin/:/usr/bin',
        logoutput => true,
        notify    => Exec['rename_aide_database'],
      }
      exec { 'rename_aide_database':
        command   => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
        creates   => '/var/lib/aide/aide.db.gz',
        path      => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
        logoutput => true,
      }
    }
    'Suse': {
      exec { 'create_aide_database':
        command   => 'aide -i',
        creates   => ['/var/lib/aide/aide.db.new', '/var/lib/aide/aide.db'],
        path      => '/sbin:/bin:/usr/sbin:/usr/bin',
        logoutput => true,
      }
    }
    'Debian': {
      exec { 'create_aide_database':
        command   => 'aideinit',
        creates   => ['/var/lib/aide/aide.db.new', '/var/lib/aide/aide.db'],
        path      => '/sbin:/bin:/usr/sbin:/usr/bin',
        logoutput => true,
      }
    }
    default: {
      warning ("Aide check is not supported on os family ${facts['os']['family']}.")
    }
  }
}
