# @api private
#  Ensure remote login warning banner is configured properly (Not Scored)
#
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This
# information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following
# options, they display operating system information: \m - machine architecture \r - operating system release \s - operating system
# name \v - operating system version
#
# @summary  Ensure remote login warning banner is configured properly (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_remote_login_warning_banner_is_configured_properly
class secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['issue_net'] {
      notify { 'issuen':
        message  => 'Not in compliance with CIS (Scored). OS and/or patch level information in /etc/issue.net',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
