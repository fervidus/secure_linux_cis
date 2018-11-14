# 1.3.1 Ensure AIDE is installed (Scored)
#
#
# Description:
# AIDE takes a snapshot of filesystem state including modification times, permissions, and file hashes which can then be
# used to compare against the current state of the filesystem to detect modifications to the system.
#
# @summary 1.3.1 Ensure AIDE is installed (Scored)
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
      command     => 'aide --init',
      refreshonly => true,
      path        => '/sbin/',
    }

  }
}
