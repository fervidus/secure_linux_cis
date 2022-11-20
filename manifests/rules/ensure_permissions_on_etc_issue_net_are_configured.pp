# @api private
#  Ensure permissions on /etc/issue.net are configured (Not Scored)
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
#
# @summary  Ensure permissions on /etc/issue.net are configured (Not Scored)
#
class secure_linux_cis::rules::ensure_permissions_on_etc_issue_net_are_configured {
  file { '/etc/issue.net':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $secure_linux_cis::banner,
  }
}
