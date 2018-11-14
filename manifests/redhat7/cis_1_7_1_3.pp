# 1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored)
#
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This
# information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following
# options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system
# name \v - operating system version
#
# @summary 1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_7_1_3
  class secure_linux_cis::redhat7::cis_1_7_1_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['issue_net'] {

      notify { 'issuen':
        message  => 'Not in compliance with CIS 1.7.1.3 (Scored). There is OS and/or patch level information in /etc/issue.net',
        loglevel => 'warning',
      }
    }
  }
}
