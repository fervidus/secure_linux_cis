#  Ensure permissions on /etc/issue.net are configured (Not Scored)
#
#
# Description:
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.
#
# @summary  Ensure permissions on /etc/issue.net are configured (Not Scored)
#
# @param enforced Should this rule be enforced
# @param banner Contents of /etc/issue.net
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_issue_net_are_configured
class secure_linux_cis::ensure_permissions_on_etc_issue_net_are_configured (
  Boolean           $enforced = true,
  Optional[String]  $banner   = undef,
) {

  if $enforced {

    file { '/etc/issue.net':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $banner,
    }
  }
}
