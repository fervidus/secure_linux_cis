# 5.4.3 Ensure default group for the root account is GID 0 (Scored)
#
#
# Description:
# The usermod command can be used to specify which group the root user belongs to. This affects permissions
#  of files that are created by the root user.
#
# @summary 5.4.3 Ensure default group for the root account is GID 0 (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_4_3
class secure_linux_cis::redhat7::cis_5_4_3 (
  Boolean $enforced = true,
) {

  if $enforced {

    user { 'root':
      ensure => present,
      gid    => '0',
    }
  }
}
