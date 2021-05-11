# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_the_selinux_mode_is_enforcing
class secure_linux_cis::rules::ensure_the_selinux_mode_is_enforcing {
  file_line { 'selinux_enforce':
    path     => '/etc/selinux/config',
    line     => 'SELINUX=enforcing',
    match    => '^SELINUX=',
    multiple => true,
  }
}
