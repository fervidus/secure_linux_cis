# @api private
#  Ensure session initiation information is collected (Scored)
#
# Description:
# Monitor session initiation events. The parameters in this section track changes to the files
# associated with session events. The file /var/run/utmp file tracks all currently logged in
# users. All audit records will be tagged with the identifier "session." The /var/log/wtmp file
# tracks logins, logouts, shutdown, and reboot events. The file /var/log/btmp keeps track of
# failed login attempts and can be read by entering the command /usr/bin/last -f
# /var/log/btmp . All audit records will be tagged with the identifier "logins."
#
# Rationale:
# Monitoring these files for changes could alert a system administrator to logins occurring at
# unusual hours, which could indicate intruder activity (i.e. a user logging in at a time when
# they do not normally log in).
#
# @summary  Ensure session initiation information is collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_session_initiation_information_is_collected
class secure_linux_cis::rules::ensure_session_initiation_information_is_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_session_initiation_information_is_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    file_line { 'audit.rules session 1':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /var/run/utmp -p wa -k session',
    }
    file_line { 'audit.rules session 2':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /var/log/wtmp -p wa -k logins',
    }
    file_line { 'audit.rules session 3':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /var/log/btmp -p wa -k logins',
    }
  }
}
