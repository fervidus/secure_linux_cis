# @api private
#
# @summary Ensure remote login warning banner is configured properly 
#
class secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly {
  if $facts['issue_net'] {
    notify { 'issuen':
      message  => 'Not in compliance with CIS (Scored). OS and/or patch level information in /etc/issue.net',
      loglevel => 'warning',
    }
  }
}
