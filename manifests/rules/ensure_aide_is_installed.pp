# @api private
#  Ensure AIDE is installed (Scored)
#
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary  Ensure AIDE is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_aide_is_installed
class secure_linux_cis::rules::ensure_aide_is_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    package { 'aide':
      ensure   => installed,
      schedule => 'harden_schedule',
      notify   => Exec['create_aide_database'],
    }
    case $facts['osfamily'] {
      'RedHat': {
        exec { 'create_aide_database':
          command   => 'aide --init',
          schedule  => 'harden_schedule',
          creates   => ['/var/lib/aide/aide.db.new.gz', '/var/lib/aide/aide.db.gz'],
          path      => '/sbin/:/usr/bin',
          logoutput => true,
          notify    => Exec['rename_aide_database'],
        }
        exec { 'rename_aide_database':
          command   => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
          schedule  => 'harden_schedule',
          creates   => '/var/lib/aide/aide.db.gz',
          path      => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
          logoutput => true,
        }
      }
      'Suse': {
        exec { 'create_aide_database':
          command   => 'aide -i',
          schedule  => 'harden_schedule',
          creates   => ['/var/lib/aide/aide.db.new', '/var/lib/aide/aide.db'],
          path      => '/sbin:/bin:/usr/sbin:/usr/bin',
          logoutput => true,
        }
      }
      'Debian': {
        exec { 'create_aide_database':
          command   => 'aideinit',
          schedule  => 'harden_schedule',
          creates   => ['/var/lib/aide/aide.db.new', '/var/lib/aide/aide.db'],
          path      => '/sbin:/bin:/usr/sbin:/usr/bin',
          logoutput => true,
        }
      }
      default: {
        warning ("Aide check is not supported on os family ${facts['osfamily']}.")
      }
    }
  }
}
