# @api private
#
# @summary Ensure users must provide password for escalation 
#
class secure_linux_cis::rules::ensure_users_must_provide_password_for_escalation {
  exec { 'Ensure users must provide password for escalation':
    command   => "/usr/bin/grep -rl '^[^#].*NOPASSWD:' /etc/sudoers /etc/sudoers.d/ | xargs sed -ri '/^#/! s/(\\s+)NOPASSWD:/\\1PASSWD:/g'",
    onlyif    => "/usr/bin/grep -rq '^[^#].*NOPASSWD:' /etc/sudoers /etc/sudoers.d/",
    logoutput => true,
  }

}
