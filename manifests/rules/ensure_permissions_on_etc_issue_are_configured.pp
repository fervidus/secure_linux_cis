# @api private
#  Ensure permissions on /etc/issue are configured (Scored)
#
# Description:
# The contents of the /etc/issue file are displayed to users prior to login for local terminals.
#
# @summary  Ensure permissions on /etc/issue are configured (Scored)
#
class secure_linux_cis::rules::ensure_permissions_on_etc_issue_are_configured {
  file { '/etc/issue':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $secure_linux_cis::banner,
  }
}
