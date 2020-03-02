# @api private
#  Ensure chrony is configured (Scored)
#
# Description:
# chrony is a daemon which implements the Network Time Protocol (NTP) is designed to
# synchronize system clocks across a variety of systems and use a source that is highly
# accurate. More information on chrony can be found at http://chrony.tuxfamily.org/. chrony
# can be configured to be a client and/or a server.
#
# Rationale:
# If chrony is in use on the system proper configuration is vital to ensuring time
# synchronization is working properly.
# This recommendation only applies if chrony is in use on the system.
#
# @summary  Ensure chrony is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param time_servers Array of valid NTP Time servers
# @param time_sync Which NTP program to use
#
# @example
#   include secure_linux_cis::ensure_chrony_is_configured
class secure_linux_cis::rules::ensure_chrony_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'RedHat': {
        $config = '/etc/sysconfig/chronyd'
        $content = 'OPTIONS="-u chrony"'
      }
      'Debian': {
        $config = '/etc/default/chrony'
        $content = 'DAEMON_OPTS="-u _chrony"'
      }
      default: {
        warning ("Chrony check is not supported on os family ${facts['osfamily']}.")
      }
    }
    if $::secure_linux_cis::time_sync == 'chrony' {
      class { '::chrony':
        servers  => $::secure_linux_cis::time_servers,
        schedule => 'harden_schedule',
      }
      file { $config:
        ensure   => file,
        schedule => 'harden_schedule',
        owner    => 'root',
        group    => 'root',
        mode     => '0644',
        content  => $content,
      }
    }
  }
}
