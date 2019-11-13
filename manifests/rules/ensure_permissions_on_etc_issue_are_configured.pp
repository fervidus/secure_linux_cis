#  Ensure permissions on /etc/issue are configured (Scored)
#
#
# Description:
# The contents of the /etc/issue file are displayed to users prior to login for local terminals.
#
# @summary  Ensure permissions on /etc/issue are configured (Scored)
#
# @param enforced Should this rule be enforced
# @param banner Contents of /etc/issue
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_issue_are_configured
class secure_linux_cis::ensure_permissions_on_etc_issue_are_configured (
  Boolean           $enforced = true,
  Optional[String]  $banner   = undef,
) {

  if $enforced {

    file { '/etc/issue':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $banner,
    }
  }
}
