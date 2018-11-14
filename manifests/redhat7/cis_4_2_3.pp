# 4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)
#
# Description:
# The rsyslog and syslog-ng software are recommended replacements to the original
# syslogd daemon which provide improvements over syslogd , such as connection-oriented
# (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of
# log data en route to a central logging server.
#
# Rationale:
# The security enhancements of rsyslog and syslog-ng such as connection-oriented (i.e.
# TCP) transmission of logs, the option to log to database formats, and the encryption of log
# data en route to a central logging server) justify installing and configuring the package.
#
# @summary 4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_2_3
class secure_linux_cis::redhat7::cis_4_2_3 (
  Boolean $enforced = true,
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
) {

  if $enforced {

    if $logging == 'rsyslog' {

      package { 'rsyslog':
        ensure => installed,
      }
    }

    elsif $logging == 'syslog-ng' {

      package { 'syslog-ng':
        ensure => installed,
      }
    }
  }
}
