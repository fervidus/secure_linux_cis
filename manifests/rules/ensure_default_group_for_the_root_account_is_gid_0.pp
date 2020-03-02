# @api private
#  Ensure default group for the root account is GID 0 (Scored)
#
#
# Description:
# The usermod command can be used to specify which group the root user belongs to. This affects permissions
#  of files that are created by the root user.
#
# @summary  Ensure default group for the root account is GID 0 (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_default_group_for_the_root_account_is_gid_0
class secure_linux_cis::rules::ensure_default_group_for_the_root_account_is_gid_0(
    Boolean $enforced = true,
) {
  if $enforced {
    user { 'root':
      ensure   => present,
      schedule => 'harden_schedule',
      gid      => '0',
    }
  }
}
