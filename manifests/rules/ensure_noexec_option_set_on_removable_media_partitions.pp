# @api private
# 0 Ensure noexec option set on removable media partitions (Not Scored)
#
#
# Description:
# The noexec mount option specifies that the filesystem cannot contain executable binaries.
#
# @summary 0 Ensure noexec option set on removable media partitions (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_noexec_option_set_on_removable_media_partitions
class secure_linux_cis::rules::ensure_noexec_option_set_on_removable_media_partitions(
    Boolean $enforced = true,
) {
  if $enforced {
    # Let's look at the name of each one and try to guess if it's removable
    $facts['mountpoints'].each | Tuple $mnt | {
      if($mnt[0] =~ /cdrom/ or $mnt[0] =~ /floppy/) {
        if member($facts['mountpoints'][$mnt[0]]['options'], 'noexec') == false {
          notify { "1_1_20 noexec ${mnt[0]}":
            message  =>  "POTENTIAL Not in compliance with CIS 0 (Not Scored). Ensure noexec option set on removable media partitions - ${mnt[0]}",  #lint:ignore:140chars
            schedule => 'harden_schedule',
            loglevel =>  'warning',
          }
        }
      }
    }
  }
}
