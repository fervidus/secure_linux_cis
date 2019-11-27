# 0 Ensure no world writable files exist (Scored)
#
# Description:
# Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2)
# man page for more information.
#
# @summary 0 Ensure no world writable files exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_world_writable_files_exist
class secure_linux_cis::rules::ensure_no_world_writable_files_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts['world_writable'] {
      notify { 'ww':
        message  => '[0] You have one or more world writable files. Check the world_writable fact for details.',
        loglevel => 'warning',
      }
    }
  }
}
