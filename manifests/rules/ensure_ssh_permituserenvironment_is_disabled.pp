# @api private
#
# @summary Ensure SSH PermitUserEnvironment is disabled 
#
class secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh permit user environment':
    ensure   => present,
    path     => '/etc/ssh/sshd_config',
    line     => 'PermitUserEnvironment no',
    match    => '^\s*PermitUserEnvironment',
    multiple => true,
    notify   => Class['secure_linux_cis::sshd_service'],
  }
}
