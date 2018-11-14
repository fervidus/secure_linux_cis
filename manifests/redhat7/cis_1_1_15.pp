# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
#
# Description:
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# @summary 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_15
class secure_linux_cis::redhat7::cis_1_1_15 (
  Boolean $enforced = true,
  ) {

    if $enforced {

      file_line { 'dev_shm':
        path   => '/etc/fstab',
        line   => 'tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0',
        notify => Exec['devm'],
        }
      exec { 'devm':
        command     => 'mount -o remount,nodev /dev/shm',
        path        => '/bin/',
        refreshonly => true,
      }
    }
}
