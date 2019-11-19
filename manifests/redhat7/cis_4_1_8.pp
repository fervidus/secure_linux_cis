# 4.1.8 Ensure login and logout events are collected (Scored)
#
# Description:
# Monitor login and logout events. The parameters below track changes to files associated
# with login/logout events. The file /var/log/lastlog maintain records of the last time a
# user successfully logged in. The /var/run/failock directory maintains records of login
# failures via the pam_faillock module.
#
# Rationale:
# Monitoring login/logout events could provide a system administrator with information
# associated with brute force attacks against user logins.
#
# @summary 4.1.8 Ensure login and logout events are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_8
class secure_linux_cis::redhat7::cis_4_1_8 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'audit.rules login/logout 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /var/log/lastlog -p wa -k logins',
    }

    case $facts['os']['family'] {
      'RedHat': {
        file_line { 'audit.rules login/logout 2':
          ensure => present,
          path   => '/etc/audit/rules.d/audit.rules',
          line   => '-w /var/run/faillock/ -p wa -k logins',
        }
      }
      'Debian': {
        file_line { 'audit.rules login/logout 2':
          ensure => present,
          path   => '/etc/audit/rules.d/audit.rules',
          line   => '-w /var/run/faillog -p wa -k logins',
        }
        file_line { 'audit.rules login/logout 3':
          ensure => present,
          path   => '/etc/audit/rules.d/audit.rules',
          line   => '-w /var/run/tallylog -p wa -k logins',
        }
      }
      default: {
      }
    }
  }
}
