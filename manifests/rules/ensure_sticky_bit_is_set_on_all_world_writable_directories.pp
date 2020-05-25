# @api private
# 1 Ensure sticky bit is set on all world-writable directories (Scored)
#
#
# Description:
# Setting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory
# that are not owned by them.
#
# @summary 1 Ensure sticky bit is set on all world-writable directories (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_sticky_bit_is_set_on_all_world_writable_directories
class secure_linux_cis::rules::ensure_sticky_bit_is_set_on_all_world_writable_directories(
  Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/ensure_sticky_ww.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/ensure_sticky_ww.sh'),
    }
    if($facts['sticky_ww'] != undef) {
      $myhash = split($facts['sticky_ww'], '\n')
      $myhash.each | String $dir | {
        notify { "World-Writable: ${dir}": }
      }
      exec { '1_1_21 - Ensure sticky bit is set on all world-writable directories (Scored)':
        path      => '/bin/',
        schedule  => 'harden_schedule',
        command   => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 -a ! -perm -1000 2>/dev/null | xargs chmod -v a+t",  #lint:ignore:140chars
        unless    => "/usr/bin/test `df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 -a ! -perm -1000 2>/dev/null |wc -l` -eq 0",  #lint:ignore:140chars
        logoutput => true,
      }
    }
  }
}
