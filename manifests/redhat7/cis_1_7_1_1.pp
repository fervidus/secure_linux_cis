# 1.7.1.1 Ensure message of the day is configured properly (Scored)
#
#
# Description:
# The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system.
# This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports
# the following options, they display operating system information: \m - machine architecture \r - operating system release \s -
# operating system name \v - operating system version
#
# @summary 1.7.1.1 Ensure message of the day is configured properly (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_1_1
class secure_linux_cis::redhat7::cis_1_7_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['motd'] {

      notify { 'motd':
        message  => '[1.7.1.1] There is OS and/or patch level information in /etc/motd',
        loglevel => 'warning',
      }
    }
  }
}
