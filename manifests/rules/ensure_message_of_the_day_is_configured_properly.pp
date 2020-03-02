# @api private
#  Ensure message of the day is configured properly (Scored)
#
#
# Description:
# The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system.
# This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports
# the following options, they display operating system information: \m - machine architecture \r - operating system release \s -
# operating system name \v - operating system version
#
# @summary  Ensure message of the day is configured properly (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_message_of_the_day_is_configured_properly
class secure_linux_cis::rules::ensure_message_of_the_day_is_configured_properly(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['motd'] {
      notify { 'motd':
        message  => 'Not in compliance with CIS  (Scored). There is OS and/or patch level information in /etc/motd',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
