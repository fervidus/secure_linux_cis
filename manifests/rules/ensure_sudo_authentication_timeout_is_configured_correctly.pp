# @api private
#
# @summary Ensure sudo authentication timeout is configured correctly
#
class secure_linux_cis::rules::ensure_sudo_authentication_timeout_is_configured_correctly {
  exec { 'Ensure sudo authentication timeout is configured correctly':
    command   => "/usr/bin/grep -rl '^[^#].*NOPASSWD:' /etc/sudoers /etc/sudoers.d/ | xargs sed -ri '/^#/! s/(\\s+)NOPASSWD:/\\1PASSWD:/g'",
    onlyif    => "/usr/bin/grep -rq '^[^#].*NOPASSWD:' /etc/sudoers /etc/sudoers.d/",
    logoutput => true,
  }

}
