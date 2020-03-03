# @api private
#  Ensure events that modify the system's network environment are collected (Scored)
#
# Description:
# Record changes to network environment files or system calls. The below parameters
# monitor the sethostname (set the systems host name) or setdomainname (set the systems
# domainname) system calls, and write an audit event on system call exit. The other
# parameters monitor the /etc/issue and /etc/issue.net files (messages displayed prelogin),
# /etc/hosts (file containing host names and associated IP addresses),
# /etc/sysconfig/network file and /etc/sysconfig/network-scripts/ directory
# (containing network interface scripts and configurations).
#
# Rationale:
# Monitoring sethostname and setdomainname will identify potential unauthorized changes
# to host and domainname of a system. The changing of these names could potentially break
# security parameters that are set based on those names. The /etc/hosts file is monitored
# for changes in the file that can indicate an unauthorized intruder is trying to change
# machine associations with IP addresses and trick users and processes into connecting to
# unintended machines. Monitoring /etc/issue and /etc/issue.net is important, as
# intruders could put disinformation into those files and trick users into providing
# information to the intruder. Monitoring /etc/sysconfig/network and
# /etc/sysconfig/network-scripts/ is important as it can show if network interfaces or
# scripts are being modified in a way that can lead to the machine becoming unavailable or
# compromised. All audit records will be tagged with the identifier "system-locale."
#
# @summary  Ensure events that modify the system's network environment are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_events_that_modify_the_system_s_network_environment_are_collected
class secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected(
    Boolean $enforced = true,
) {
  Class['secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules network 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
      }
      file_line { 'audit.rules network 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
      }
      file_line { 'audit.rules network 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/issue -p wa -k system-locale',
      }
      file_line { 'audit.rules network 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/issue.net -p wa -k system-locale',
      }
      file_line { 'audit.rules network 5':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/hosts -p wa -k system-locale',
      }
      case $facts['osfamily'] {
        'RedHat': {
          file_line { 'audit.rules network 6':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/sysconfig/network -p wa -k system-locale',
          }
          file_line { 'audit.rules network 7':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/sysconfig/network-scripts/ -p wa -k system-locale',
          }
        }
        'Debian': {
          file_line { 'audit.rules network 6':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/network -p wa -k system-locale',
          }
        }
        default: {
          warning ("Network audit rules are not supported on os family ${facts['osfamily']}.")
        }
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules network 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
      }
      file_line { 'audit.rules network 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/issue -p wa -k system-locale',
      }
      file_line { 'audit.rules network 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/issue.net -p wa -k system-locale',
      }
      file_line { 'audit.rules network 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/hosts -p wa -k system-locale',
      }
      case $facts['osfamily'] {
        'RedHat': {
          file_line { 'audit.rules network 5':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/sysconfig/network -p wa -k system-locale',
          }
          file_line { 'audit.rules network 6':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/sysconfig/network-scripts/ -p wa -k system-locale',
          }
        }
        'Debian': {
          file_line { 'audit.rules network 5':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/audit/rules.d/audit.rules',
            line     => '-w /etc/network -p wa -k system-locale',
          }
        }
        default: {
          warning ("Network audit rules are not supported on os family ${facts['osfamily']}.")
        }
      }
    }
  }
}
