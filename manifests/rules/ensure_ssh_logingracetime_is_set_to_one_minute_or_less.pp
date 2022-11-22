# @api private
#
# @summary Ensure SSH LoginGraceTime is set to one minute or less 
#
class secure_linux_cis::rules::ensure_ssh_logingracetime_is_set_to_one_minute_or_less {
  include secure_linux_cis::sshd_service

  if $secure_linux_cis::login_grace_time > 60 or $secure_linux_cis::login_grace_time < 1 {
    fail('The Login Grace Time parameter has been manually set past the 1 - 60 threshold')
  }
  file_line { 'ssh login grace time':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "LoginGraceTime ${secure_linux_cis::login_grace_time}",
    match  => '^#?LoginGraceTime',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
