# 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_18
class secure_linux_cis::redhat7::cis_1_1_18 (
  Boolean $enforced = true,
){
  if $enforced {

    # Let's look at the name of each one and try to guess if it's removable
    $facts['mountpoints'].each | Tuple $mnt | {
      if($mnt[0] =~ /cdrom/ or $mnt[0] =~ /floppy/) {
        if member($facts['mountpoints'][$mnt[0]]['options'], 'nodev') == false {
          notify { "1_1_18 nodev ${mnt[0]}":
            message  =>  "POTENTIAL Not in compliance with CIS 1.1.18 (Not Scored). Ensure nodev option set on removable media partitions - ${mnt[0]}",  #lint:ignore:140chars
            loglevel =>  'warning',
          }
        }
      }
    }

  }
}
