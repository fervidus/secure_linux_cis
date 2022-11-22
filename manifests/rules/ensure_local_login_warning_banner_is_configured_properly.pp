# @api private
#
# @summary Ensure local login warning banner is configured properly 
#
class secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly {
  if $facts['issue_os'] {
    notify { 'issue':
      message  => 'Not in compliance with CIS (Scored). There is OS and/or patch level information in /etc/issue',
      loglevel => 'warning',
    }
  }
}
