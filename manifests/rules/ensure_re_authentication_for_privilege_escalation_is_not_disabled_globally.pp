# @api private
#
# @summary Ensure re-authentication for privilege escalation is not disabled globally
#
class secure_linux_cis::rules::ensure_re_authentication_for_privilege_escalation_is_not_disabled_globally {
  exec { 'Ensure re-authentication for privilege escalation is not disabled globally':
    command   => "/usr/bin/grep -rl '^[^#].*\!authenticate' /etc/sudoers /etc/sudoers.d/ | xargs sed -ri '/^#/! s/(\\s+)\!authenticate/\\1authenticate/g'",
    onlyif    => "/usr/bin/grep -rq '^[^#].*\!authenticate' /etc/sudoers /etc/sudoers.d/",
    logoutput => true,
  }

}
